require("which-key").setup()

require("which-key").add({
	{ "<leader>f", group = "Find" },
	{ "<leader>g", group = "Git" },
	{ "<leader>c", group = "Code" },
	{ "<leader>r", group = "Refactor" },
	{ "<leader>v", group = "Venv" },
})
