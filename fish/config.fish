# Locale/editor
set -gx LANG en_US.UTF-8
set -gx VISUAL nvim
set -gx EDITOR nvim

# vi mode
fish_vi_key_bindings

fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.cargo/bin
fish_add_path -g $HOME/.local/bin/goose

source ~/.config/fish/aliases.fish
source ~/.config/fish/secrets.fish

# fzf + ag default command

if test -d /opt/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi/bin
    fish_add_path -g /opt/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi/bin
end

set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore ~/.config/ag/.ignore -l -g ""'

# ensure: chmod 600 ~/.config/fish/secrets.fish
test -f ~/.config/fish/secrets.fish; and source ~/.config/fish/secrets.fish

# Aliases
# nvm (if installed there)
#set -gx NVM_DIR ~/.config/nvm
# test -s "$NVM_DIR/nvm.sh"; and bass source "$NVM_DIR/nvm.sh"

# comand -q means: quietly check if <tool> exists in PATH
command -q mise; and mise activate fish | source
command -q starship; and starship init fish | source
