require("nvim-treesitter.configs").setup({
  ignore_install = { "help" },
  ensure_installed = { "javascript", "typescript", "lua", "html", "css", "json", "bash", "terraform", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  auto_install = false, -- Do not auto install missing parsers on startup
})

-- Set the parser install directory globally to ensure parsers are saved and detected properly
require("nvim-treesitter.install").compilers = { "clang", "gcc", "clang++" }
require("nvim-treesitter.install").prefer_git = true
