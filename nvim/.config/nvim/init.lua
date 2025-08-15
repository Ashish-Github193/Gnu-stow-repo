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

require("core.options")

-- Initialize file size constraints before loading plugins
local constraints = require("core.file-size-constraints")
constraints.setup_autocmd()

-- Load all plugins (plugins.lua now handles collecting all plugin specs)
require("plugins")

-- Load remaining configuration
require("core.keymaps")
require("utils.performance-monitor")
