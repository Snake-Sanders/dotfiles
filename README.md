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

## Target directory

There is a hidden file `dotfiles/.stowrc` indicating where to create the
symlinks, otherwise we would need to create a folder for each module in order 
to preserve the structure, like `dotfiles/mise/mise/`.
Also `.stowrc` has ignore file list.

## Update

To remove a file

`stow -D <file_name>`

To add a module

`cd dotfiles && stow .`

### Alternative structure

Another way is by module but this does only work when the source modules are 
already in subfolders like `dotfiles/fish/fish`.

1. create the `fish` folder and its content into `~/dotfiles/.config/`
2. `cd ~/dotfiles/`
3. `stow fish`
4. check there is a link file in `~/.config/fish/config.fish` to `~/dotfiles/fish/config.fish`

Example add multiple packages:

```
stow zsh git tmux
```
