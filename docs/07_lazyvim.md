# LazyVim

Changed to **lazyVim**, see:

<https://www.lazyvim.org/>

## Dependencies

For Git and external tool is needed

`brew install jesseduffield/lazygit/lazygit`

## Changed

* to avoid opening the file explorer sidebar every time lazyvim is launched, do
not use the dot, call it just with: `nvim`.

## Troubleshooting

* Clashing keymap

If you suspect a conflict with the key `gc` in normal mode (n), you can run:

`:verbose nmap gc`

Then you can remove the conflict keymap, in this case `gco` with:

`vim.keymap.del("n", "gco")`
