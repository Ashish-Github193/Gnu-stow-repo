-- Enhanced git integration
return {
  {
    "sindrets/diffview.nvim",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("diffview.nvim", category)
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup()
    end,
  },

  {
    "NeogitOrg/neogit",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("neogit", category)
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup()
    end,
  },
}