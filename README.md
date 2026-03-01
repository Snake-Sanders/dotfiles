# Dot files

Development Environment Configuration on MacOS

```
brew install stow
cd ~
git clone git@github.com:Snake-Sanders/dotfiles.git
cd dotfiles
stow .
```

Route zsh to the config:

Edit `~/.zshenv` file:

```
ZDOTDIR=$HOME/.config/zsh
```

## Update

To remove a file

`stow -D <file_name>`

To add a file

1. put the new `x` file into `~/dotfiles/.config/`
2. `cd ~/dotfiles/`
3. `stow .`
4. check there is a link file in `~/.config/x` to `~/dotfiles/.config/x`
