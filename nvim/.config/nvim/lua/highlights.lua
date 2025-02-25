require("nvim-highlight-colors").setup({
  render = "background", -- Options: 'background', 'foreground', 'virtual'
  enable_hex = true,
  enable_rgb = true,
  enable_hsl = true,
  enable_var_usage = true,
  enable_named_colors = true,
  enable_tailwind = true,

  virtual_symbol = " ● ",
  virtual_symbol_prefix = "",
  virtual_symbol_suffix = "",
  virtual_symbol_position = "inline",
})

require("cmp").setup({
  formatting = {
    format = require("nvim-highlight-colors").format,
  },
})
