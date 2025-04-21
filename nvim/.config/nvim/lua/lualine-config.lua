require("lualine").setup({
  options = {
    theme = "rose-pine", -- or 'tokyonight', 'onedark', 'dracula', etc.
  },
  sections = {
    lualine_x = {
      require("mcphub.extensions.lualine"),
    },
  },
})
