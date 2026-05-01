return {
  -- disable buffer tabs
  { "akinsho/bufferline.nvim", enabled = false },
  -- gc conflicts with mini comments gcc gcl
  { "nvim-mini/mini.comment", enabled = false },
  -- autocomplete is distracting
  { "hrsh7th/nvim-cmp", enabled = false },
  -- flash search clashesh with suround keymap
  { "folke/flash.nvim", enabled = false },
  -- avoids crates.nvim to hit the network on every Cargo.toml open
  { "saecki/crates.nvim", enabled = false },
  -- blink autocompletion
  -- { "saghen/blink.cmp", enabled = false },
}
