
## nerdfont

## ZSH and OhMyZsh

1. install ZSH
sudo apt install zsh

2. set as default shell
sudo usermod -s /usr/bin/zsh $(whoami)

3. install ohmyzsh
sh -c "$(curl -fsSL <https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh>)"

## FZF

The version in Ubuntu is quite old, so the keybinding
`CTRL + R` does not work. Better to clone fzf git repo and install it directly from the sources.

```sh
git clone --depth 1 <https://github.com/junegunn/fzf.git> ~/.fzf
~/.fzf/install

```

## Lua and luarocks

```sh
sudo apt install lua5.1
sudo apt install luarocks
```

## Lazyvim

Install `nodejs` from package manager

```sh
sudo apt install fd-find
sudo apt install tree
```

If it is not possible to yank to the clipboard in order to paste it outside
neovim, the add this line to .config/nvim/lua/config/options.lua

`vim.opt.clipboard = ""`

## Ubuntu key shortcuts

The default key shortcuts from Ubuntu conflict with Neovim. By restoring
these files these shortcuts are disabled.

- backup key shortcuts

```sh
dconf dump /org/gnome/desktop/peripherals/ > ./src/periferals.bkp
dconf dump /org/gnome/desktop/wm/keybindings/ > ./src/keybindings.bkp
```

- resotre key settings

```sh
dconf load /org/gnome/desktop/peripherals/ < ./src/periferals.bkp
dconf load /org/gnome/desktop/wm/keybindings/ < ./src/keybindings.bkp

```

## Vpn

1. Install the OpenVPN plugin:
Open the terminal and run
sudo apt-get install network-manager-openvpn-gnome
to install the OpenVPN integration for NetworkManager.

2. Get configuration files:
Download the .ovpn configuration file from your work's VPN portal or from your IT department.

3. Import the connection:
Go to Settings > Network > VPN and click the + button. Select "Import from file..." and choose the .ovpn file you downloaded.

4. Enter credentials:
When prompted, enter your work account username and password.
Connect:
You should now see the VPN listed in your network settings. Click the toggle to connect.
