local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if Lazy.nvim exists
if not vim.loop.fs_stat(lazypath) then
  print("Lazy.nvim not found. Installing...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Prepend to runtime path
vim.opt.rtp:prepend(lazypath)

