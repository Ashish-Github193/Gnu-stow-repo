require("supermaven-nvim").setup({
	keymaps = {
		accept_suggestion = "<Tab>",
		clear_suggestion = "<C-]>",
		accept_word = "<C-j>",
	},
	ignore_filetypes = { "help", "TelescopePrompt" },
	color = {
		suggestion_color = "#ffffff",
		cterm = 244,
	},
})
