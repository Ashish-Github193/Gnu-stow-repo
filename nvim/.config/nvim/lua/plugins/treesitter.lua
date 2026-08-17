require("nvim-treesitter").setup()

require("nvim-treesitter").install({
	"python",
	"lua",
	"javascript",
	"typescript",
	"tsx",
	"markdown",
	"markdown_inline",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"python",
		"lua",
		"javascript",
		"typescript",
		"typescriptreact",
		"markdown",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
