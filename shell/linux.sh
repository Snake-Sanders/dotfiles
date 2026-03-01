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

jlink() {
  command JLinkGDBServer -device AE302F80F55D5_HE "$@"
}

bat() {
  command batcat "$@"
}
