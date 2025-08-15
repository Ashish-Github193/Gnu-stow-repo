-- Themes
return {
  --  { "catppuccin/nvim", name = "catppuccin" },
  --  { "folke/tokyonight.nvim", name = "tokyonight" },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
}