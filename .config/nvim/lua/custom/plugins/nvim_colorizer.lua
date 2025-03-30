return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      '*', -- Highlight all files, but customize some others.
      css = { rgb_fn = true, hsl_fn = true }, -- Enable parsing rgb(...) and hsl(...) functions in css
      js = { rgb_fn = true, hsl_fn = true }, -- Enable parsing rgb(...) and hsl(...) functions in css
      html = { names = false }, -- Enable parsing "names" like Blue or Gray
      '!vim', -- Exclude vim from highlighting
    }, {
      mode = 'background', -- Set the display mode.
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "Name" codes like Blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    })
  end,
}
