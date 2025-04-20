-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- disabled animations
vim.g.snacks_animate = false

-- vertical rule
vim.opt.colorcolumn = "80"

vim.opt.foldenable = false -- Disable folding by default
vim.opt.foldmethod = "manual" -- Manual folding only (optional but recommended)

-- Disable code block folding in markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 0
    vim.opt_local.concealcursor = ""
  end,
})
