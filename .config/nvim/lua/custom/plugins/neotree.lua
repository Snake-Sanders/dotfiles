return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    -- ctr + b = toggles file explorer tree
    vim.keymap.set('n', '<leader>b', ':Neotree filesystem toggle right<CR>', {})
  end,
} 
