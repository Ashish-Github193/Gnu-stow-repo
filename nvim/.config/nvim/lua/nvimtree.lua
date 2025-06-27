require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = "left",
    adaptive_size = true,
    number = false,
    relativenumber = false,
    -- Enable smooth animations for tree operations
    float = {
      enable = false, -- Keep tree docked but with smooth transitions
    },
  },
  renderer = {
    group_empty = true,
    -- Smooth icon transitions
    icons = {
      show = {
        folder_arrow = true,
      },
      glyphs = {
        folder = {
          arrow_closed = "▶",
          arrow_open = "▼",
        },
      },
    },
    -- Smooth indentation
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
  },
  filters = { 
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      -- Smooth file opening
      resize_window = true,
    },
    expand_all = {
      -- Smooth expand/collapse
      max_folder_discovery = 300,
      exclude = { ".git", "target", "build" },
    },
  },
  hijack_netrw = false,
  disable_netrw = false,
  -- Enable smooth update animations
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
})
