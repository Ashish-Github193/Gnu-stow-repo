vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("colorscheme tokyonight-night")

vim.o.updatetime = 50
vim.o.termguicolors = true
vim.o.cmdheight = 0

-- Undotree options
vim.g.undotree_WindowLayout = 2
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1

-- Fix Ctrl-S being captured by terminal
vim.cmd("silent! !stty -ixon < /dev/tty > /dev/tty")

vim.diagnostic.config({
	virtual_text = false,
	float = { "always" },
})
