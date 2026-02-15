# Mise

<!--toc:start-->
- [Mise](#mise)
  - [Install](#install)
  - [Restore from config](#restore-from-config)
  - [Install tools globally](#install-tools-globally)
  - [Tools](#tools)
    - [Starship](#starship)
    - [FZF](#fzf)
    - [Silver search](#silver-search)
    - [FD](#fd)
    - [RipGrep](#ripgrep)
<!--toc:end-->

<https://mise.jdx.dev/>

## Install

    brew install mise
  
Add mise to the shell. Usually in your .bashrc / .zshrc:

    eval "$(mise activate zsh)"

## Restore from config

To install all the tools defined in the config file. Copy the file and run

Copy the config file

    ~/.config/mise/config.toml

Install the dependencies

    mise install

## Install tools globally

You can search for tools with:

    mise tool <name>

To install new tools globally, example `bat`:

    mise use -g bat@latest

## Pin all tools

Once all the tools are installed it is recommended to pin them.

    mise pin --all

You can check all the mise tools with:

    mise list

## Tools

Here is a list of tools that now I am installing with Mise.
I can't install `ag` so for now stays with `brew`.

### Starship

I dropped Power Level 10k for Starship, the previous was convoluting the environment variables and the configuration files.

<https://starship.rs/>

`brew install starship`

Add the following to the end of ~/.zshrc:

`eval "$(starship init zsh)"`

The config file goes in `~/.config/starship.toml`

### FZF

Install `fzf`

`berew install fzf`

now configure fzf in `.zshrc`

```bash
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
```

### Silver search

Install `ag`

`berew install the_silver_searcher`

now configure `ag` in `.zshrc`

```bash
# use silver searcher (ag) plug for find files ignoring .git
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
```

### FD

Alternative version for `find`
It is required by `Telescope` nvim plug.

<https://github.com/sharkdp/fd>

`brew install fd`

### RipGrep

another replacement for grep, this is needed for nvim grep function
`<leader> + ps` which uses ripgrep underneath.

```bash
brew install ripgrep
```
