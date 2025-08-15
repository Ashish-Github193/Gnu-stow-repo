-- Noice - UI enhancements
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("noice.nvim", category)
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          format = {
            search_down = {
              view = "cmdline",
            },
            search_up = {
              view = "cmdline",
            },
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
        },
      })

      require("notify").setup({
        timeout = 3000,
        stages = "slide",
        max_width = function()
          return math.floor(vim.o.columns * 0.60)
        end,
        on_open = function(win)
          -- Ensure the window is non-focusable
          vim.api.nvim_win_set_config(win, { focusable = false })
        end,
      })
    end,
  },
}