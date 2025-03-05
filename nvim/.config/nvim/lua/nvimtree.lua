require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = "right",
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = { dotfiles = false },
})
