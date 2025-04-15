vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.o.updatetime = 50
vim.o.termguicolors = true
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 1
vim.o.foldenable = true
vim.o.foldcolumn = "1"

vim.g.python3_host_prog = "/home/x/.local/share/mise/installs/python/3.11.11/bin/python3"

vim.diagnostic.config({
  virtual_text = false,
  float = { "always" },
})
