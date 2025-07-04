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
    bottom_search = true, -- Improves search UI
    command_palette = true, -- Shows commands in a floating window
    long_message_to_split = true, -- Long messages in a separate window
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
