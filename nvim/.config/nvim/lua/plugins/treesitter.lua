require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "lua", "javascript", "typescript" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
