# TMUX

https://www.youtube.com/watch?v=jaI3Hcw-ZaA&list=RDCMUCo71RUe6DX4w-Vd47rFLXPg&index=4

## Installation

`brew install tmux`

## Configuration

create a file unser `~/.config/tmux/tmux.conf`

### Plug manager

Add TMU the plug manager

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

now it is time to add plugs

## Color Theme

just add the plug with the following line

`set -g @plugin 'catppuccin/tmux'`

and paste the settings for `Config 3` example

## NeoVim integration

Check tmux nvim navigator plug

## Tmux resurrect

saves you sessions and can be restored after system restart

add to you `tmux.conf`:

`set -g @plugin 'tmux-plugins/tmux-resurrect'`

Key bindings:

- prefix + Ctrl-s - save
- prefix + Ctrl-r - restore

** note r clashes with reload r **

ref: https://github.com/tmux-plugins/tmux-resurrect
## Tmuxifier 

(package not used at the moment)

allows creating sessions templates

https://github.com/jimeh/tmuxifier

`git clone git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier



## Usage

https://www.youtube.com/watch?v=-B5VDp50daI&list=PLsz00TDipIfct4F3pHv6_uI9OyjphQEGZ&index=4

- Reload configuration [leader] + r
- Install pluggins [leader] + I
- Create a new pane vertical [leader] + c
- Split pane vertical [leader] + %
- Split pane horizontal [leader] + "
- Run commad [leader] + : + command (press TAB to get options)
- deattach from session [leader] + d
- close pane session [leader] + x
- change window with [leader] + p (previous)
- change window with [leader] + n (next)
- change window with [leader] + 1 (number)

To list the session, exit and run
`tmux list-sessions`
or
`tmux ls`

to reattach to the session:
`tmux attach`
