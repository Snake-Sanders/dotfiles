return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              files = {
                excludeDirs = { "target", ".git", "node_modules" },
              },
              cargo = {
                allTargets = false,
                buildScripts = {
                  enable = false,
                },
              },
              check = {
                allTargets = false,
              },
              procMacro = {
                enabled = false,
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
