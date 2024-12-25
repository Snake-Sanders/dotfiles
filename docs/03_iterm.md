# iTerm2
- [iTerm2](#iterm2)
  - [ZSH](#zsh)
  - [Color scheme](#color-scheme)
  - [Oh My Zsh](#oh-my-zsh)
  - [Nerd Fonts](#nerd-fonts)
  - [Starship](#starship)
  - [ZSH Plugins](#zsh-plugins)
    - [ZSH syntax highlight](#zsh-syntax-highlight)
    - [ZSH Auto suggestions](#zsh-auto-suggestions)
    - [ZSH Web-search](#zsh-web-search)
  - [Fix Terminal font](#fix-terminal-font)
  - [Fuzzy Finder](#fuzzy-finder)
    - [FZF](#fzf)
    - [Silver search](#silver-search)
  - [Appendix](#appendix)
    - [Power Level 10k (obsolete)](#power-level-10k-obsolete)


The default terminals on MacOS (/bin/zsh) does **not** support true colors, so better to use _iTerm2_ instead

https://iterm2.com/

Here is how to pimp your terminal for macos
https://www.youtube.com/watch?v=wNQpDWLs4To


## ZSH

make shure you have zsh as default

   > echo $0
   > -zsh

## Color scheme

- go to https://iterm2colorschemes.com/
- search for `Gruvbox Dark`
- download the style file, save it as `.itermcolors`
- go to iTerm2, open settings/profiles/colors tab
- import the theme file
- make sure the style is selected.

- Avoid dimming panes
1. got to settings/apparence/dimming
2. remove `dim inactive split panes`

## Oh My Zsh

- go to `https://ohmyz.sh/`
- install with curl

## Nerd Fonts

- go to `nerdfonts.com`
- go to downloads and select a font type
- then download it and install it

option 1: double click on it to install one by one
option 2:

    brew tap homebrew/cask-fonts &&
    brew install --cask font-jetbrains-mono-nerd-font

- open iTerm2 settings/profiles/text tab and in `Font` field
  select the new font.

- under `settings/general/selection` select `Applications in terminal may access clipboard`. This is for copying text in Tmux.

## Starship

I dropped Power Level 10k for Starship, the previous was convoluting the environment variables and the configuration files.

https://starship.rs/

`brew install starship`

Add the following to the end of ~/.zshrc:

`eval "$(starship init zsh)"`

the config file goes in `~/.config/starship.toml`

## ZSH Plugins

### ZSH syntax highlight

https://github.com/zsh-users/zsh-syntax-highlighting

check the specific installation section for `Oh-my-zsh`

- Install the package:

`brew install zsh-syntax-highlighting`

- Enable `zsh-syntax-highlighting` by sourcing the script. Running this command on the terminal will add the source line to the end of your `.zshrc`:

  echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

Activate the plugin in ~/.zshrc:

    plugins=( [plugins...] zsh-syntax-highlighting)

Restart zsh (such as by opening a new instance of your terminal emulator).

### ZSH Auto suggestions

https://github.com/zsh-users/zsh-autosuggestions

Clone this repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):

    plugins=(
        # other plugins...
        zsh-syntax-highlighting
        zsh-autosuggestions
    )

Start a new terminal session.

### ZSH Web-search

This plug allows you to search directly from the console.

example:

`brs weather in Umeo`
`google trailes 2024`

Just add the plug `web-search` to the pluggins list in `~.zshrc`

```
  plugins=(
      zsh-autosuggestions
      zsh-syntax-highlighting
      web-search
  )
```

## Fix Terminal font

If after these steps you open termianl (/bin/zsh) and the prompt has strange characters, then go to Terminal settings change the font to `JetBrainMonoNL NFM Regular 14`

This is one of the adapted fonts from here https://www.nerdfonts.com/font-downloads

## Fuzzy Finder

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

https://github.com/sharkdp/fd

`brew install fd`

### RipGrep

another replacement for grep, this is needed for nvim grep function
`<leader> + ps` which uses ripgrep underneath.

```bash
brew install ripgrep
```
## Appendix

### Power Level 10k (obsolete)

This plug was nice for a while, but the when one realize the amount of
variables create in the environments it might not be worth it. Use starship.

Power Level 10k changes the console style. Go to:

https://github.com/romkatv/powerlevel10k

Note: The installation with `brew` **does not work**, it can't find the installed package in the path.

I install it directly from source.

notice how this checks out the repo directly under `Oh my zsh` themes directory:

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

- enabled this plug
- open `~/zshrc` and set

  ZSH_THEME="powerlevel10k/powerlevel10k"

- save the file
- source the file with `source ~/.zshrc`
- setup this plug with the wizard that shows up automatically. If this does not start, check out the home page on how use the command to lauch.

If you want to reconfigure the style, just run assistant again:

`p10k configure`
