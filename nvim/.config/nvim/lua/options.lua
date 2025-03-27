vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.o.updatetime = 500
vim.o.termguicolors = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldcolumn = "1"
vim.o.fillchars = "fold: "
vim.g.python3_host_prog = "/home/x/.local/share/mise/installs/python/3.11.11/bin/python3"
vim.diagnostic.config({
  virtual_text = false,
  float = { "always" },
})
