# Dot files

Development Environment Configuration on MacOS

```
cd ~
git clone git@github.com:Snake-Sanders/dotfiles.git
mise dotfiles apply
```

Route zsh to the config:

Edit `~/.zshenv` file:

```
export ZDOTDIR="$HOME/.config/zsh/<OS>"
```

## Target directory

Symlinks are managed by mise's `[dotfiles]` table in `dotfiles/mise/config.toml`,
which maps each module to its target under `~/.config`, e.g.:

```toml
"~/.config/nvim" = "~/dotfiles/nvim"
```

## Update

To add a module

1. add an entry to `[dotfiles]` in `dotfiles/mise/config.toml`
2. `mise dotfiles apply`

To remove a module

1. delete its entry from `[dotfiles]`
2. `rm ~/.config/<module>` (mise won't remove existing symlinks on its own)

Check current state any time with `mise dotfiles status`.

## Migrating other machines off stow

On a machine that still has the old stow-managed symlinks, unstow *before*
pulling — `stow -D .` needs the old `.stowrc`, which the pull removes:

1. `cd ~/dotfiles && stow -D .`
2. `git pull`
3. `mise dotfiles apply`
