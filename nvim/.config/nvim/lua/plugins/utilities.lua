-- Utility plugins
return {
  -- Undo tree
  { "mbbill/undotree" },

  -- Supermaven support
  {
    "supermaven-inc/supermaven-nvim",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("supermaven-nvim", category)
    end,
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },

  -- Highlight colors
  {
    "brenoprata10/nvim-highlight-colors",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("nvim-highlight-colors", category)
    end,
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },

  -- Performance monitoring
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- OSC 52 clipboard support for SSH
  {
    "ojroques/nvim-osc52",
    keys = {
      { "<leader>y", function() return require("osc52").copy_operator() end, expr = true, desc = "OSC52: Yank motion" },
      { "<leader>Y", function() require("osc52").copy_operator(); return "V" end, expr = true, desc = "OSC52: Yank current line" },
      { "<leader>y", function() require("osc52").copy_visual() end, mode = "v", desc = "OSC52: Yank visual selection" },
    },
    config = function()
      require("osc52").setup()
    end,
  },

  -- UFO folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufRead",
    keys = {
      { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
      { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Open folds except kinds" },
      { "zm", function() require("ufo").closeFoldsWith() end, desc = "Close folds with" },
      { "zp", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek folded lines" },
      { "<leader>zf", function() require("ufo").openFoldsExceptKinds() end, desc = "Open folds except kinds" },
      { "<leader>zc", function() require("ufo").closeFoldsWith() end, desc = "Close folds with" },
    },
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}