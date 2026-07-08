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

[ -f "$HOME/.config/shell/lambda.sh" ] && source "$HOME/.config/shell/lambda.sh"

panic() {
  "$HOME/ubuntu/panic" "$@"
}

deepseek() {
  command ollama run deepseek-coder:6.7b "$@"
}

qwen3() {
  command ollama run qwen3:8b "$@"
}


bat() {
  command batcat "$@"
}
