require("supermaven-nvim").setup({
	keymaps = {
		accept_suggestion = "<CR>",
		clear_suggestion = "<C-]>",
	},
	ignore_filetypes = { "help", "TelescopePrompt" },
	color = {
		suggestion_color = "#ffffff",
		cterm = 244,
	},
})
