# Mise

<https://mise.jdx.dev/>

## Install

    brew install mise
  
Add mise to the shell. Usually in your .bashrc / .zshrc:

    eval "$(mise activate zsh)"

## Restore from config

To install all the tools defined in the config file. Copy the file and run

copy the config file

    ~/.config/mise/config.toml

Install the dependencies

    mise install

## Install tools globally

To install new tools globally, example `bat`:

    mise use -g bat@latest
