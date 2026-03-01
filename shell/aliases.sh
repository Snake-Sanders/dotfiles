# remove aliases form zsh
unalias ll 2>/dev/null
unalias la 2>/dev/null

ll() { /bin/ls -lh "$@"; }
la() { /bin/ls -lah "$@"; }
lla() { /bin/ls -lah "$@"; }
tree() { command tree -L 2 "$@" }
kb() { /bin/sh "$HOME/.kanata.sh" }
