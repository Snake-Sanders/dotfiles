eval "$(/opt/homebrew/bin/brew shellenv)"
# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh

# custom configuration

export LANG=en_US.UTF-8
export EDITOR=nvim
# vi mode
set -o vi

# Activate mise (must be before using tools installed by mise)
eval "$(mise activate zsh)"
eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.config/shell/aliases.sh" ] && source "$HOME/.config/shell/aliases.sh"
[ -f "$HOME/.config/shell/secrets.sh" ] && source "$HOME/.config/shell/secrets.sh"

# FZF default search using ag
export FZF_DEFAULT_COMMAND='ag --hidden --ignore ~/.config/ag/.ignore -l -g ""'

# Syntax highlighting (must be last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
