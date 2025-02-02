return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  ft = 'rust', -- Only load for Rust files

  config = function()
    -- Configure the plugin when it's loaded
    local mason_registry = require 'mason-registry'
    local codelldb = mason_registry.get_package 'codelldb'
    local extension_path = codelldb:get_install_path() .. '/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
    -- If you are on Linux, replace the line above with the line below:
    -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    local cfg = require 'rustaceanvim.config'

    vim.g.rustaceanvim = {
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
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
