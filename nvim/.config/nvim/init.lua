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
require("plugins")
require("keymaps")
require("pgitsigns")
require("pnoice")
require("pindent")
require("pconform")
require("cmp-setup")
require("lsp")
require("treesitter")
require("ptelescope")
require("nvimtree")
require("colorscheme")
require("highlights")
require("plualine")
