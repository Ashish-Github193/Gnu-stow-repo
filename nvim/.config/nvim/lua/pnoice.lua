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
  timeout = 500,
  stages = "slide",
})
