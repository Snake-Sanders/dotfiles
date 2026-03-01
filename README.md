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
export ZDOTDIR="$HOME/.config/zsh/<OS>"
```

## Update

To remove a file

`stow -D <file_name>`

To add a module

1. create the `fish` folder and its content into `~/dotfiles/.config/`
2. `cd ~/dotfiles/`
3. `stow fish`
4. check there is a link file in `~/.config/fish/config.fish` to `~/dotfiles/fish/config.fish`

Example add multiple packages:

```
stow zsh git tmux
```
