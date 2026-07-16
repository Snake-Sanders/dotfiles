LAMBDA_TARGET_DIR="$HOME/src/lambda/cross/target/thumbv8m.main-none-eabihf"

# echoes the elf path for a core (he|hp) and profile (debug|release, default debug)
lambda_elf() {
  case "$1" in
  he) echo "$LAMBDA_TARGET_DIR/${2:-debug}/vps-application" ;;
  hp) echo "$LAMBDA_TARGET_DIR/${2:-debug}/vps-hp-application" ;;
  *)
    echo "usage: lambda_elf {he|hp} [debug|release]" >&2
    return 1
    ;;
  esac
}

# resolves <variant>'s elf then runs: <tool> <elf> <extra args...>
lambda_run() {
  local variant="$1" tool="$2"
  shift 2
  local elf
  elf="$(lambda_elf "$variant")" || {
    echo "usage: $tool {he|hp}" >&2
    return 1
  }
  command "$tool" "$elf" "$@"
}

rtt_release() {
  nc localhost 19021 | defmt-print -e "$(lambda_elf he release)" "$@"
}

rtt_debug() {
  nc localhost 19021 | defmt-print -e "$(lambda_elf he debug)" "$@"
}

jlink() {
  local variant="$1"
  shift
  case "$variant" in
  he) command JLinkGDBServer -device AE302F80F55D5_HE -if swd -RTTTelnetPort 19021 -port 3333 "$@" ;;
  hp) command JLinkGDBServer -device AE302F80F55D5_HP -if swd -RTTTelnetPort 19022 -port 4444 "$@" ;;
  *)
    echo "usage: jlink {he|hp}" >&2
    return 1
    ;;
  esac
}

gdbma() { lambda_run "$1" gdb-multiarch "${@:2}"; }
armgdb() { lambda_run "$1" arm-none-eabi-gdb "${@:2}"; }
armnm() { lambda_run "$1" arm-none-eabi-nm "${@:2}" -CS --size-sort; }
armsize() { lambda_run "$1" arm-none-eabi-size -A "${@:2}"; }
armelf() { lambda_run "$1" arm-none-eabi-readelf --all --wide --demangle=rust "${@:2}"; }
