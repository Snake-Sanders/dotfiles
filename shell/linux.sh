tree() { command tree -L 2 "$@" }

work() {
  cd "$HOME/src/lambda" "$@"
}

notes() {
  cd "$HOME/src/my/notes" "$@"
}

boombox() {
  cd "$HOME/src/boombox" "$@"
}

rtt_release() {
  nc localhost 19021 | defmt-print -e cross/target/thumbv8m.main-none-eabihf/release/vps-application "$@"
}

rtt_debug() {
  nc localhost 19021 | defmt-print -e cross/target/thumbv8m.main-none-eabihf/debug/vps-application "$@"
}

panic() {
  "$HOME/ubuntu/panic" "$@"
}

deepseek() {
  command ollama run deepseek-coder:6.7b "$@"
}

qwen3() {
  command ollama run qwen3:8b "$@"
}

jlink(){
  local variant="$1"
  shift
  case "$variant" in
    he) command JLinkGDBServer -device AE302F80F55D5_HE -if swd -RTTTelnetPort 19021 -port 3333 "$@" ;;
    hp) command JLinkGDBServer -device AE302F80F55D5_HP -if swd -RTTTelnetPort 19022 -port 4444 "$@" ;;
    *) echo "usage: jlink {he|hp}" >&2; return 1 ;;
  esac
}

gdbma(){
  local variant="$1"
  shift
  case "$variant" in
    he) command gdb-multiarch cross/target/thumbv8m.main-none-eabihf/debug/vps-application "$@" ;;
    hp) command gdb-multiarch cross/target/thumbv8m.main-none-eabihf/debug/vps-hp-application "$@" ;;
    *) echo "usage: gdbma {he|hp}" >&2; return 1 ;;
  esac
}
armgdb(){
  local variant="$1"
  shift
  case "$variant" in
    he) command arm-none-eabi-gdb cross/target/thumbv8m.main-none-eabihf/debug/vps-application "$@" ;;
    hp) command arm-none-eabi-gdb cross/target/thumbv8m.main-none-eabihf/debug/vps-hp-application "$@" ;;
    *) echo "usage: gdbma {he|hp}" >&2; return 1 ;;
  esac
}


bat() {
  command batcat "$@"
}
