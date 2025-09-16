require("neo-tree").setup({
	window = {
		position = "right", -- options: "left", "right", "float", "current"
	},
	filesystem = {
		filtered_items = {
			visible = true, -- show hidden files *and* filtered items
			hide_dotfiles = false, -- do not hide dotfiles
			hide_gitignored = false, -- (optional) show files ignored by git
		},
	},
})
