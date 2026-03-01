unalias ll 2>/dev/null
unalias la 2>/dev/null
ll() { /bin/ls -lh "$@"; }
la() { /bin/ls -lah "$@"; }
lla() { /bin/ls -lah "$@"; }
