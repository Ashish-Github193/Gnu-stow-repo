require("lualine").setup({
  options = {
    theme = "iceberg_dark", -- or 'tokyonight', 'onedark', 'dracula', etc.
  },
  sections = {
    lualine_x = {
      require("mcphub.extensions.lualine"),
    },
  },
})
