return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true, -- Show dotfiles in file picker
          ignored = true, -- Optional: show gitignored files in file picker
        },
        grep = {
          hidden = true, -- Search inside hidden files
          ignored = false, -- Optional: search inside gitignored files
        },
        explorer = {
          hidden = true, -- Show dotfiles in explorer
          ignored = false, -- Optional: show gitignored files in explorer
        },
      },
    },
    explorer = {
      open_on_startup = false, -- 👈 this disables the auto open
      auto_close = false,
    },
  },
}
