require("nvim-highlight-colors").setup({
	render = "background", -- Options: 'background', 'foreground', 'virtual'
	enable_hex = true,
	enable_rgb = true,
	enable_hsl = true,
	enable_var_usage = true,
	enable_tailwind = true,
})

require("cmp").setup({
	formatting = {
		format = require("nvim-highlight-colors").format,
	},
})
