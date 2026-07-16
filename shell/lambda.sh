gdbma() {
  # gdb-multiarch on he|hp's elf (debug profile)
  run_cmd "$1" gdb-multiarch "${@:2}"
}
armgdb() {
  # arm-none-eabi-gdb on he|hp's elf (debug profile)
  run_cmd "$1" arm-none-eabi-gdb "${@:2}"
}
armnm() {
  # symbol table for he|hp's elf, sorted by size
  run_cmd "$1" arm-none-eabi-nm "${@:2}" -CS --size-sort
}
armsize() {
  # section size breakdown for he|hp's elf
  run_cmd "$1" arm-none-eabi-size -A "${@:2}"
}
armelf() {
  # full readelf dump (demangled) for he|hp's elf
  run_cmd "$1" arm-none-eabi-readelf --all --wide --demangle=rust "${@:2}"
}

# resolves <variant>'s elf then runs: <tool> <elf> <extra args...>
run_cmd() {
  local variant="$1" tool="$2"
  shift 2
  local elf
  elf="$(lambda_elf "$variant")" || {
    echo "usage: $tool {he|hp}" >&2
    return 1
  }
  command "$tool" "$elf" "$@"
}

# probe_flash he|hp [release] — flash the built ELF onto the target over SWD
# using probe-rs (NOT JLinkGDBServer/gdb). Quick one-shot flash, no debug
# session attached afterwards, no reset-and-run either — power-cycle or
# `jlink` if you want it running.
# Chip name is baked in per variant below. If it fails with "chip not found",
# look up the right string with: probe-rs chip list | grep -i ae302
probe_flash() {
  local variant="$1" profile="${2:-debug}"
  shift $(($# >= 2 ? 2 : 1))
  local elf chip
  elf="$(lambda_elf "$variant" "$profile")" || return 1
  chip="$(arm_chip "$variant")" || return 1
  probe-rs download --chip "$chip" --binary-format elf "$elf" "$@"
}

# jlink he|hp — starts JLinkGDBServer in the background for the given core,
# waits for its TCP port to come up, then attaches gdb to it and:
#   target extended-remote localhost:<port>   connect gdb to the server just started
#   load                                      flash the debug-profile ELF over SWD
#   monitor reset                             reset the core so it starts from main
# gdb is left interactive after that (no -batch) — normal prompt, set
# breakpoints/continue/step as usual. Quitting gdb also kills the backgrounded
# JLinkGDBServer (via the RETURN trap below), so nothing is left running.
# RTT logs are NOT read here — run `rtt` in another pane.
jlink() {
  local variant="$1" port rtt_port device elf
  device="$(arm_chip "$variant")" || return 1
  port="$(arm_gdb_port "$variant")" || return 1
  rtt_port="$(arm_rtt_port "$variant")" || return 1
  elf="$(lambda_elf "$variant")" || return 1

  set -x
  JLinkGDBServer -device "$device" -if swd -RTTTelnetPort "$rtt_port" -port "$port" &
  { set +x; } 2>/dev/null
  local gdbserver_pid=$!
  trap 'kill "$gdbserver_pid" 2>/dev/null' RETURN

  # JLinkGDBServer takes a moment to bind its port; without this wait gdb's
  # first connect attempt can fail before the server is ready.
  until nc -z localhost "$port" 2>/dev/null; do sleep 0.2; done

  set -x
  arm-none-eabi-gdb \
    -ex "target extended-remote localhost:$port" \
    -ex 'load' \
    -ex 'monitor reset' \
    "$elf"
  { set +x; } 2>/dev/null
}

# rtt he|hp [debug|release] — connects to the RTT telnet port opened by
# `jlink` for that core (19021=he, 19022=hp) and decodes the stream with
# defmt-print against the matching ELF. Run `jlink he|hp` first, this just
# reads the log side, it doesn't flash or attach gdb.
rtt() {
  local variant="$1" profile="${2:-debug}"
  shift $(($# >= 2 ? 2 : 1))
  local elf port
  elf="$(lambda_elf "$variant" "$profile")" || return 1
  port="$(arm_rtt_port "$variant")" || return 1
  nc localhost "$port" | defmt-print -e "$elf" "$@"
}

# arm_chip he|hp — echoes the JLink/probe-rs device name for a core
arm_chip() {
  case "$1" in
  he) echo "AE302F80F55D5_HE" ;;
  hp) echo "AE302F80F55D5_HP" ;;
  *)
    echo "usage: arm_chip {he|hp}" >&2
    return 1
    ;;
  esac
}

# arm_gdb_port he|hp — echoes the JLinkGDBServer port used for that core
arm_gdb_port() {
  case "$1" in
  he) echo 3333 ;;
  hp) echo 4444 ;;
  *)
    echo "usage: arm_gdb_port {he|hp}" >&2
    return 1
    ;;
  esac
}

# arm_rtt_port he|hp — echoes the RTT telnet port used for that core
arm_rtt_port() {
  case "$1" in
  he) echo 19021 ;;
  hp) echo 19022 ;;
  *)
    echo "usage: arm_rtt_port {he|hp}" >&2
    return 1
    ;;
  esac
}

# echoes the elf path for a core (he|hp) and profile (debug|release, default debug)
lambda_elf() {
  local target_dir="$HOME/src/lambda/cross/target/thumbv8m.main-none-eabihf"
  case "$1" in
  he) echo "$target_dir/${2:-debug}/vps-application" ;;
  hp) echo "$target_dir/${2:-debug}/vps-hp-application" ;;
  *)
    echo "usage: lambda_elf {he|hp} [debug|release]" >&2
    return 1
    ;;
  esac
}
