local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("options")

-- Initialize file size constraints before loading plugins
local constraints = require("file-size-constraints")
constraints.setup_autocmd()

require("plugins")
require("keymaps")
require("auto-session-config")
require("gitsigns-config")
require("noice-config")
require("indent-config")
require("conform-config")
require("cmp-setup")
require("lsp")
require("treesitter")
require("telescope-config")
require("nvimtree")
require("colorscheme")
require("highlights")
require("lualine-config")
require("trouble-config")
require("treesitter-textobjects-config")
require("performance-monitor")
