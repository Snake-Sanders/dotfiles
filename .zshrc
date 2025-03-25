# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# ZSH Framework plugin like asdf for oh-my-zsh source this script and setup completions.
plugins=(zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# asdf was installed with homebrew, do we need to plug asdf for zsh 
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

export EDITOR=nvim

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# use silver searcher (ag) plug for find files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore ~/.config/ag/.ignore -l -g ""'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
alias ll="ls -l"
alias la="la -la"
alias lla="ls -la"
alias cbe="cd /Users/mac/src/work/cm-backend"
alias cpr="cd /Users/mac/src/work/cm-processor"
alias tree="tree -L 2"

eval "$(starship init zsh)"

# rust
. "$HOME/.cargo/env"

# Syntax higlight has to be the last configuration!
# If you receive "highlighters directory not found" error message,
# you may need to add the following to your.zshenv:
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


