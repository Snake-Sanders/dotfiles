# Ubuntu installation of custom tools and configuration

## Install essentials

sudo apt install stow vim git

## dotfiles

With stow now you can checkout this `dotfiles` repo

## Nerdfonts

How to test if the fonts are installed.

Open your shell's configuration file (e.g., .zshrc) and add export NERD_FONT_CHECK_AUTO=1.
Restart the terminal and run a command. If icons appear correctly, the font is installe
export NERD_FONT_CHECK_AUTO=1

## ZSH

1. Install ZSH
sudo apt install zsh

2. set as default shell
sudo usermod -s /usr/bin/zsh $(whoami)

3. Install ohmyzsh
sh -c "$(curl -fsSL <https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh>)"
4. Install Zsh plugins

- zsh-autosuggestions:

git clone <https://github.com/zsh-users/zsh-autosuggestions> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

- zsh-syntax-highlighting

git clone <https://github.com/zsh-users/zsh-syntax-highlighting.git> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## FZF

The version in ubuntu is quite old, so the keybindings CTRL + R does not work.
Better to clone fzf and install it directly from the sources.

say yes to everything, we want the keybindings.

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

Silver search is used by FZF for string manipulation. See .zshrc and the
export variable `FZF_DEFAULT_COMMAND`.

    sudo apt install silversearcher-ag 

## Lua and luarocks

    sudo apt install lua5.1
    sudo apt install luarocks

## Lazygit

For Ubuntu 24 use this command, for 25 on you can use apt install.

```sh
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```

## Neovim

Install it from app center, neovim-snap is the latest. The devian package is 0.9, too old.

snap install neovim

## Ghostty

    snap install ghostty --classic

Set as default terminal

    gsettings set org.gnome.desktop.default-applications.terminal exec '/snap/ghostty/current/bin/ghostty'

## Starship

    curl -sS https://starship.rs/install.sh | sh

## Nerdfonts

I am using FiraMono

1. Download a Nerd Font

<https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraMono.zip>

2. Unzip and copy to ~/.fonts

    mkdir ~/.fonts
    cp  ~/Downloads/FiraMono/* ~/.fonts/

3. Run the command fc-cache -fv to manually rebuild the font cache

## Lazyvim

Install lazyvim dependencies:

    sudo apt install fd-find nodejs tree silversearcher-ag lazygit

This will not install the latest node, got to their page

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

restart the shell

    nvm install 24

**Copy & Paste**

For **wayland** install this tool to allow copy out of neovim

    sudo apt install wl-clipboard

For **Xorg**: Install xsel or xclip

**Ripgrep**

Snaks requires ripgrep

    sudo apt-get install ripgrep

Now to make sure all requirements were installed

Open nvim and type `:checkhealth`

If there is an error about `tree-sitter executable not found`, try to run:

    cargo install tree-sitter-cli

## Bat

    sudo apt intall bat

The executable is called `batcat` but using an alias in zshrc solves the problem.

## Code-name Goose

See ttps://block.github.io/goose/docs/quickstart/

## VPN

1. install the OpenVPN plugin:
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

    sudo apt-get install network-manager-openvpn-gnome

## Ubuntu custom key shortcuts

Most of Ubuntu default shortcut conflict with neovim shortcuts. And since these
shortcuts are different from MacOS then it is better to disable them.

you can change this using the GUI, Settings -> Keyboards -> Keyboard Shortcuts

- backup key shortcuts

    dconf dump /org/gnome/desktop/peripherals/ > ./src/periferals.bkp
    dconf dump /org/gnome/desktop/wm/keybindings/ > ./src/keybindings.bkp

- resotre key settings

    dconf load /org/gnome/desktop/peripherals/ < ./src/periferals.bkp
    dconf load /org/gnome/desktop/wm/keybindings/ < ./src/keybindings.bkp

## Brave Browser

With brave you can use CTRL + number to select a tab. This does not work in
Firefox.

    curl -fsS https://dl.brave.com/install.sh | sh

## Tmux

Install:

    sudo apt install tmux

Checkout the package manager called TPM:

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Then to install all the dependencies and plugs, open tmux and press <leader> + I
