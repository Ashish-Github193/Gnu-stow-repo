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
vim.g.gitblame_enabled = 1 -- Enable Git Blame by default
vim.g.gitblame_message_template = " <author> • <date> • <summary>"
vim.g.gitblame_display_virtual_text = 1 -- Show inline blame
vim.g.gitblame_date_format = "%Y-%m-%d" -- Custom date format
