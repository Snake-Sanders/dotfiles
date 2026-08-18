#!/usr/bin/env bash
set -euo pipefail

SCRIPT_FILE="$HOME/.config/mise/scripts/qa.sh"
TASK_FILE="$HOME/.config/mise/config.linux.toml"
cd "${MISE_ORIGINAL_CWD:-.}"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  cat <<EOF
qa: Run all quality checks for a Rust project

Script: $SCRIPT_FILE
Task:   $TASK_FILE (mise task "qa")

Commands run:
  1. cargo fmt                                    (format Rust source)
  2. tombi format                                  (format TOML files)
  3. cargo clippy --all-targets -- -D warnings     (lint, warnings as errors)
EOF
  exit 0
fi

if [[ ! -f "Cargo.toml" ]]; then
  echo "you are not in a rust project." >&2
  exit 1
fi

echo "==> Formatting Rust"
cargo fmt
changed_rs=$(git diff --name-only -- '*.rs' 2>/dev/null || true)
if [ -z "$changed_rs" ]; then
  echo "    rust: already formatted"
else
  echo "    rust: reformatted"
  echo "$changed_rs" | sed 's/^/      /'
fi

echo "==> Formatting TOML"
tombi format
changed_toml=$(git diff --name-only -- '*.toml' 2>/dev/null || true)
if [ -z "$changed_toml" ]; then
  echo "    toml: already formatted"
else
  echo "    toml: reformatted"
  echo "$changed_toml" | sed 's/^/      /'
fi

echo "==> Clippy"
cargo clippy --all-targets -- -D warnings
echo "    clippy: clean"

echo "All checks passed."
