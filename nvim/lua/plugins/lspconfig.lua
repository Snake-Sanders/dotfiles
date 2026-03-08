return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = {
                ignored = {
                  ethosu_rs_macro = { "load_model" },
                },
              },
            },
          },
        },
      },
    },
  },
}
