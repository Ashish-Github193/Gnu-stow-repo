local telescope = require("telescope")

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"build",
			"dist",
			"coverage",
			"%.pyc$",
			"__pycache__",
			"%.log$",
			"%.test.js$",
			"%.spec.js$",
			"package%-lock.json",
			"yarn.lock",
			".git",
			".gitignore",
			"node_modules/.*",
			".vscode",
			".idea",
			"tmp",
			".DS_Store",
		},
	},
})

telescope.load_extension("fzf")
