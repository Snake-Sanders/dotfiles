# TMUX CheatSheet

Definition of Leader Key: [leader]

- `Ctrl + b` leader key is defined by default as .
- `Ctrl + s` the custom biding is set to

## Configuration

Create a a file `~/.config/tmux/tmux.conf` to customize and define keybindings
load the configuration with:

- [leader] + I to install the plugs set in the config
- [leader] + r to reload configuration
- [leader] + : to manualy load config by adding the commad mode
  and by adding `source-file <CONFIG_FILE_PATH>`

## Basics

- [leader] + x exits a pane
- [leader] + t shows clock
- [leader] + ? lists shorcuts
- [leader] + d d://github.com/catppuccin/tmux
- [leader] + c to create a new pane vertical
- [leader] + % to split pane vertical
- [leader] + " to split pane horizontal
- Run commad [leader] + : + command (press TAB to get options)
- deattach from session [leader] + d
- close pane session [leader] + x
- change window with [leader] + p (previous)
- change window with [leader] + n (next)
- change window with [leader] + 1 (number)

## Sessions

_Prefix commands with [leader]_

    :new<CR>  new session
    s  list sessions
    $  name session

`tmux kill-session -t myname`

## Windows (tabs)

_Prefix commands with [leader]_

    c create window
    w list windows
    n next window
    p previous window
    f find window
    , name window
    & kill window

## Panes split

_Prefix commands with [leader]_

    % vertical split
    " horizontal split

    o  swap panes
    q  show pane numbers
    x  kill pane
    +  break pane into window (e.g. to select text by mouse to copy)
    -  restore pane from window
       space - toggle between layouts

    { moves the current pane left
    } moves the current pane right
    z toggle pane zoom

leader + arrows to move among panes

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

## Commands

leader + : to start typing a command

tmux ls: list the current sessions
tmux attach: reconnects to the session

### Scroll

`Ctrl`-`b` then `[` then you can use your normal navigation keys to scroll around (eg. `Up Arrow` or `PgDn`). Press `q` to quit scroll mode.

Alternatively you can press `Ctrl`-`b` `PgUp` to go directly into copy mode and scroll one page up (which is what it sounds like you will want most of the time)

In `vi` mode (see below), you can also scroll the page up/down line by line using `Shift`-`k` and `Shift`-`j` (if you're already in scroll mode). Unshifted, the cursor moves instead of the page.

Excerpts from the [man page][1]:

> tmux may be controlled from an attached client by using a key combination of a prefix key, ‘C-b’ (Ctrl-b) by default, followed by a command key.

     The default command key bindings are:

    [           Enter copy mode to copy text or view the history.

    Function                     vi              emacs
    --------                     --              -----
    Back to indentation          ^               M-m
    Clear selection              Escape          C-g
    Copy selection               Enter           M-w
    Cursor down                  j               Down
    Cursor left                  h               Left
    Cursor right                 l               Right
    Cursor to bottom line        L
    Cursor to middle line        M               M-r
    Cursor to top line           H               M-R
    Cursor up                    k               Up
    Delete entire line           d               C-u
    Delete to end of line        D               C-k
    End of line                  $               C-e
    Goto line                    :               g
    Half page down               C-d             M-Down
    Half page up                 C-u             M-Up
    Next page                    C-f             Page down
    Next word                    w               M-f
    Paste buffer                 p               C-y
    Previous page                C-b             Page up
    Previous word                b               M-b
    Quit mode                    q               Escape
    Scroll down                  C-Down or J     C-Down
    Scroll up                    C-Up or K       C-Up
    Search again                 n               n
    Search backward              ?               C-r
    Search forward               /               C-s
    Start of line                0               C-a
    Start selection              Space           C-Space
    Transpose chars                              C-t

Plus a bunch more. Note that you have to press `C-b` twice if you use that for page up since `C-b` is bound as the command key. See the man page for information on prefacing a copy mode command with a repeat count.

You can set the key binding mode using `Ctrl`-`b`, then

    :set-window-option mode-keys emacs

or `vi`.

[1]: http://linux.die.net/man/1/tmux
