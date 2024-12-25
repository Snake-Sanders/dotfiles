# sources

## The primeagen (youtube)

https://www.youtube.com/watch?v=w7i4amO_zaE

## typecraft (youtube)

https://www.youtube.com/watch?v=4zyZ3sw_ulc&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=3

# NeoVim

    brew install neovim

- create the configuration file for neovim

  ~/.config/nvim/init.lua

Here is to add iTerm to your nvim settings
Add the following to your `init.lua` config:

`vim.cmd("set termguicolors")`

Install a color scheme supporting true color, like gruvbox-material.

https://github.com/sainnhe/gruvbox-material

Switch to it colorsheme gruvbox-material.

## install plugs for neovim

1.  `lazy`: (package manager)
2.  `catpuccin`: (color scheme)
3.  `telescope`: (fuzzy finder)
4.  `treesitter`: (creates AST abstract syntax tree for syntax highlight)
5.  `lsp-config`: plug to configure the LSP services
6.  `mason`: automatically install the plugs configured in lsp-config
7.  `conform`: autoformats the code, here is set format on save
8.  `neotree`: neo tree (tree navigation)
    - `Neotree filesystem reveal right`

for more plugs check: https://github.com/rockerBOO/awesome-neovim

## Elixir Lsp

ref: https://github.com/elixir-lsp/elixir-ls#building-and-running

First, clone the repor under `~/src/github/`

    git clone https://github.com/elixir-lsp/elixir-ls.git ~/src/github/elixir-lsp/
    cd elixir-ls
    mix deps.get
    MIX_ENV=prod mix compile
    mkdir release
    MIX_ENV=prod mix elixir_ls.release2 -o release

the last param `release` is just a relative directory, it can be changed.

now this is your lsp service directory

    `~/src/github/elixir-ls/release`

then, configure the nvim plug `lsp-config.lua`

	-- setup for Elixir
	elixirls = {
		cmd = { "/Users/<YOUR_USER>/src/github/elixir-ls/release/language_server.sh" },
		capabilities = capabilities,
	},

## Tutorial

start `nvim` and type `:help` to beging the introduction

if the help page show a treesitter highlight error while scrolling the page, then install the highliter for this file `:TSUpdate vimdoc`

## Troubleshooting

Try to run Health check

`:checkheath`

if there are still conflicts with packer then delete the folder `~/.local/shared/nvim/xx/plug`

## Install Neovim on Linux Mint

Linux Mint is always behind, the version available on `apt-get` is neovim 0.6 
but the current is 0.10. To install manually do:

- Chose a version from the stable releases

https://github.com/neovim/neovim/releases/tag/stable

- Install wget:

    sudo apt install wget 

- Download the package

    wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod u+x nvim.appimage

- Extract the AppImage Contents 

This will create a folder called squashfs-root with all of Neovim's files inside.

    ./nvim.appimage --appimage-extract

- Move the Entire Directory. 

Move the entire squashfs-root directory to a location like /opt/nvim, which is 
commonly used for software installations outside the default system paths.

    sudo mv squashfs-root /opt/nvim

- Create a Symlink for the nvim Binary

    sudo ln -s /opt/nvim/usr/bin/nvim /usr/local/bin/nvim

- Verify the installation 

    nvim --version
    nvim testfile.txt

