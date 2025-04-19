-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- [[ The Primeagen Keybinds ]]

-- space + pv -> shows previows view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "show prev view" })

-- move selected lines up (shift K) down (shift J)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up" })

-- when joining lines with Shift J the cursor remains in its place
vim.keymap.set("n", "J", "mzJ`z")
-- keeps cursor static when paginating
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "page up" })

-- keeps cursor static when searching
vim.keymap.set("n", "n", "nzzzv", { desc = "find next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "find prev" })

-- keeps copy buffer after paste
-- x is visual mode, s is select mode, v is both
-- 1. yank something, then select something else and leader p to replace it
vim.keymap.set("x", "<leader>p", '"_dP')
-- copy to clipboard to be pasted outside neovim
vim.keymap.set("n", "<leader>y", '"+y', { desc = "copy to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "copy to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "copy to clipboard" })

-- avoid replay last recorded macro
vim.keymap.set("n", "Q", "<nop>")

-- Deletes useless Lazyvim keymaps
vim.keymap.del("n", "gco")
vim.keymap.del("n", "gcc")
vim.keymap.del("n", "gc0")

-- [[ Debugger Keybindings ]]

-- Nvim DAP
-- vim.keymap.set('n', '<leader>dl', "<cmd>lua require'dap'.step_into()<CR>", { desc = 'Debugger step into' })
-- vim.keymap.set('n', '<leader>dj', "<cmd>lua require'dap'.step_over()<CR>", { desc = 'Debugger step over' })
-- vim.keymap.set('n', '<leader>dk', "<cmd>lua require'dap'.step_out()<CR>", { desc = 'Debugger step out' })
-- vim.keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<CR>", { desc = 'Debugger continue' })
-- vim.keymap.set('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = 'Debugger toggle breakpoint' })
-- vim.keymap.set(
--   'n',
--   '<leader>dd',
--   "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
--   { desc = 'Debugger set conditional breakpoint' }
-- )
-- vim.keymap.set('n', '<leader>de', "<cmd>lua require'dap'.terminate()<CR>", { desc = 'Debugger reset' })
-- vim.keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.run_last()<CR>", { desc = 'Debugger run last' })
--
-- rustaceanvim
-- vim.keymap.set('n', '<leader>dt', "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = 'Debugger testables' })
