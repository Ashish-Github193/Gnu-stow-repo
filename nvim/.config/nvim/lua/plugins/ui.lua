-- UI plugins
return {
  -- Buffer management
  {
    "akinsho/bufferline.nvim",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("bufferline.nvim", category)
    end,
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "buffer_id",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          themable = true,
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          show_buffer_close_icons = true,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          enforce_regular_tabs = false,
          always_show_bufferline = false,
          sort_by = "insert_after_current",
        },
      })
    end,
  },

  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end,
  },

  -- Minimap
  {
    "gorbit99/codewindow.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>mo", "<cmd>lua require('codewindow').open_minimap()<cr>", desc = "Open minimap" },
      { "<leader>mc", "<cmd>lua require('codewindow').close_minimap()<cr>", desc = "Close minimap" },
      { "<leader>mt", "<cmd>lua require('codewindow').toggle_minimap()<cr>", desc = "Toggle minimap" },
    },
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({
        auto_enable = false,
        minimap_width = 13,
        relative = "win",
        width_multiplier = 4,
        screen_bounds = "background",
        window_border = "none",
        events = { "TextChanged", "InsertLeave", "DiagnosticChanged" },
      })
    end,
  },
}
