require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = "left",
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = { dotfiles = false },
})
