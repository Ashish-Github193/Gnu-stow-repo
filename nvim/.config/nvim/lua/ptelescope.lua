require("telescope").setup({
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
      "package-lock.json",
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
  extensions = {
    fzf = {
      fuzzy = true, -- Enable fuzzy matching
      override_generic_sorter = true, -- Override generic sorter
      override_file_sorter = true, -- Override file sorter
      case_mode = "smart_case", -- Case-insensitive unless uppercase is used
    },
  },
})

require("telescope").load_extension("fzf")
