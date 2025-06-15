require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = "left",
    adaptive_size = true,
    number = false,
    relativenumber = false,
  },
  renderer = {
    group_empty = true,
  },
  filters = { 
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  hijack_netrw = false,
  disable_netrw = false,
})
