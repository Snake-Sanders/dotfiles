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

3. Install the plugs (nvim/hjkl navigation + yaml layout loader):

```sh
mise run bootstrap
```

This runs `herdr plugin install` for both plugs (see `[tasks.bootstrap]` in
`~/dotfiles/mise/config.toml`). It's safe to re-run any time. To install a
single plug manually instead:

```sh
herdr plugin install lmilojevicc/herdr-splits.nvim
herdr plugin install yuk1ty/herdr-spreader
```

https://github.com/lmilojevicc/herdr-splits.nvim

In the plug config disable the [autozoom](https://github.com/lmilojevicc/herdr-splits.nvim#auto-unzoom)

The configuration file for herdr-spreader already exist in:
`~/dotfiles/herdr/plugins/config/herdr-spreader/config.yaml`

then apply the layout with:

`herdr plugin action invoke herdr-spreader.apply`

there is a shorcut in mise config to call just `herdr-layout`

## Troubleshooting

if the plugins do not work try inspecting the logs:

```sh
herdr plugin log list --plugin herdr-spreader --limit 1 | jq
```
