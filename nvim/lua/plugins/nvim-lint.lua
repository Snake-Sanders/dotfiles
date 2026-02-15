return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      -- disables warn for line length limit
      markdownlint = {
        args = { "--disable", "MD013", "--" },
      },
    },
  },
}
