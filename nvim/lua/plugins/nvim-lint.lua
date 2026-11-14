return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        -- disables warn for line length limit
        markdownlint = {
          args = { "--disable", "MD013", "--" },
        },
      },
      linters_by_ft = {
        rust = { "cspell" },
        sh = { "cspell" },
        markdown = { "markdownlint", "cspell" },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "cspell", "markdownlint" } },
  },
}
