require("nvim-treesitter").setup({
	ensure_installed = { "python", "lua", "javascript", "typescript", "tsx" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
