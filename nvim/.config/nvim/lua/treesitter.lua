require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "javascript", "typescript", "lua", "html", "css", "json", "bash", "terraform" },
  highlight = { enable = true },
  indent = { enable = true },
  fold = { enable = true },
})
