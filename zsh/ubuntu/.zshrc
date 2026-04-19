# Set the path to this dir in ~/.zshenv
# export ZDOTDIR="$HOME/.config/zsh/ubuntu/"

export PATH="$HOME/.local/bin:$PATH"

# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh
DISABLE_AUTO_TITLE=true

# Custom configuration

# Activate mise (must be before using tools installed by mise)
eval "$(mise activate zsh)"
eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# FZF default search using ag
export FZF_DEFAULT_COMMAND='ag --hidden --ignore ~/.config/ag/.ignore -l -g ""'
export LANG=en_US.UTF-8
export EDITOR="nvim"
export VISUAL="bat"
set -o vi
bindkey -M viins '^[[200~' bracketed-paste

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.config/shell/secrets.sh" ] && source "$HOME/.config/shell/secrets.sh"
[ -f "$HOME/.config/shell/linux.sh" ] && source "$HOME/.config/shell/linux.sh"

# Aliases
alias ll="ls -lh --color=auto"
alias la="ls -lach --color=auto"
alias lla="ls -lach --color=auto"


# dev tools
# arm toolchaing
export PATH="$PATH:/opt/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi/bin"

# installation of Models for gst-eyetracking app
export VPS_ROOT_DIR="${HOME}/src/tracking_models"
export GOOSE_BIN_DIR="$HOME/.local/bin/goose"
export PATH="$GOOSE_BIN_DIR:$PATH"

# rust env
. "$HOME/.local/share/../bin/env"

# Syntax highlighting (must be last)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

