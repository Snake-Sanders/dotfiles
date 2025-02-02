return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  ft = 'rust', -- Only load for Rust files
  config = function()
    -- Configure the plugin when it's loaded
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {},
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          -- Buffer-local keymaps - these only apply to Rust files
          vim.keymap.set('n', '<leader>ca', function()
            vim.cmd.RustLsp 'codeAction'
          end, {
            silent = true,
            buffer = bufnr,
            desc = 'Rust Code Action',
          })

          vim.keymap.set('n', 'K', function()
            vim.cmd.RustLsp { 'hover', 'actions' }
          end, { silent = true, buffer = bufnr })
        end,
      },
    }
  end,
}
