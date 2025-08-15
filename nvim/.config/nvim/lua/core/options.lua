vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.o.updatetime = 50
vim.o.termguicolors = true
vim.o.foldmethod = "indent"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:O,foldsep: ,foldclose:C]]

-- Fix Ctrl-S being captured by terminal
vim.cmd("silent! !stty -ixon < /dev/tty > /dev/tty")

vim.g.python3_host_prog = "/home/x/.local/share/mise/installs/python/3.11.12/bin/python3"

vim.diagnostic.config({
  virtual_text = false,
  float = { "always" },
})
