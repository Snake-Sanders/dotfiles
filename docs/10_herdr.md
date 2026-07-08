# Herdr

https://herdr.dev/

The replacement of tmux

Install:

1. If Herdr was not previously installed then first do:
  - update `~/dotfiles` with `git pull`
  - create herdr config symlinks with `cd ~/dotfiles && stow`
2. Install Herdr:

```sh
curl -fsSL https://herdr.dev/install.sh | sh
```

3. Install the plug for neovim and hjkl navigation.

```sh
herdr plugin install lmilojevicc/herdr-splits.nvim
```

https://github.com/lmilojevicc/herdr-splits.nvim

In the plug config disable the [autozoom](https://github.com/lmilojevicc/herdr-splits.nvim#auto-unzoom)
