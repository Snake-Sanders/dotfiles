return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    -- <leader>b = toggles file explorer tree
    vim.keymap.set('n', '<leader>b', ':Neotree filesystem toggle right<CR>', {})
    -- \ = reveals current file in tree
    vim.keymap.set('n', '\\', ':Neotree reveal<CR>', { silent = true })
  end,
  opts = {
    open_on_setup = false,
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
