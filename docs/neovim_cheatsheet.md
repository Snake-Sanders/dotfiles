# Neovim Cheatsheet

## File management

- `%`: creates new file
- `d`: creates new directory
- `:Ex`: opens file explorer

## Format

If you set in the config a defined tab lenght, example:

`set tabstop=2`

then you can force replacing tabs for spaces with the command:

`:retab`

### Neo Tree

- `a`: to add a file or directory, directory ends with `/`

## Edit

- select text + `=`: formats text

### Select block within symbols

Example:

    fruit_names = [ "apple", "orange", "pear"]

command: vi + symbol
selects the content **excluding** the symbol
anywhere within `[` and `]`, press `vi` + `[`
will select the content `"apple", "orange", "pear"`


command: va + symbol
selects the content **including** the symbol
anywhere within `[` and `]`, press `va` + `[`
will select the content `[ "apple", "orange", "pear"]`

### Select a word

anywhere on the word type `viw` will sellect the whole word.
Also works with `viW`

### Search and replace

`%s@search@replace@gc`

## Navigation

`%` on top of `{`, `(`, `)`, `}` and will jump to the matchin pair.

## Diagnostics

`:LspInto` to see if the LSP is running, in case syntax highlight is broken.
`:Mason` to check the plug installation for syntax, autocomplete, parser, highlight.
`:nmap` to see all the key remapping.

## Comment code

`g c` and then move the cursor to select lines to be commented out

## Code actions

`<leader> + c + a` opens code action

## Code symbols


`<leader> + c + s` opens code symbols, a tree of functions and variables
