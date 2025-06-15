-- Performance monitoring utilities
local M = {}

-- Enable Lazy.nvim profiling
if vim.fn.has('nvim-0.9') == 1 then
  vim.loader.enable()
end

-- Function to check plugin load times
M.profile_plugins = function()
  require("lazy").profile()
end

-- Function to show startup time breakdown
M.startup_time = function()
  vim.cmd("StartupTime")
end

-- Function to monitor memory usage
M.memory_usage = function()
  local memory_kb = vim.fn.luaeval("collectgarbage('count')")
  local memory_mb = memory_kb / 1024
  print(string.format("Neovim Memory Usage: %.2f MB", memory_mb))
end

-- Function to show loaded plugins
M.loaded_plugins = function()
  local lazy = require("lazy")
  local plugins = lazy.plugins()
  local loaded = {}
  local not_loaded = {}
  
  for name, plugin in pairs(plugins) do
    if plugin._.loaded then
      table.insert(loaded, name)
    else
      table.insert(not_loaded, name)
    end
  end
  
  print("=== LOADED PLUGINS (" .. #loaded .. ") ===")
  for _, name in ipairs(loaded) do
    print("✓ " .. name)
  end
  
  print("\n=== NOT LOADED PLUGINS (" .. #not_loaded .. ") ===")
  for _, name in ipairs(not_loaded) do
    print("○ " .. name)
  end
end

-- Function to check LSP client memory
M.lsp_memory = function()
  local clients = vim.lsp.get_active_clients()
  if #clients == 0 then
    print("No active LSP clients")
    return
  end
  
  print("=== ACTIVE LSP CLIENTS ===")
  for _, client in ipairs(clients) do
    print(string.format("LSP: %s (ID: %d)", client.name, client.id))
  end
end

-- Function to show treesitter parsers
M.treesitter_parsers = function()
  local parsers = require("nvim-treesitter.parsers")
  local installed = parsers.get_parser_configs()
  
  print("=== TREESITTER PARSERS ===")
  for lang, _ in pairs(installed) do
    if parsers.has_parser(lang) then
      print("✓ " .. lang)
    end
  end
end

-- Auto-command to log slow operations
vim.api.nvim_create_autocmd("User", {
  pattern = "LazySync",
  callback = function()
    print("Lazy sync completed - check :Lazy profile for performance data")
  end,
})

-- Keymaps for quick monitoring
vim.keymap.set("n", "<leader>pp", M.profile_plugins, { desc = "Profile plugins" })
vim.keymap.set("n", "<leader>pm", M.memory_usage, { desc = "Memory usage" })
vim.keymap.set("n", "<leader>pl", M.loaded_plugins, { desc = "Loaded plugins" })
vim.keymap.set("n", "<leader>ps", M.startup_time, { desc = "Startup time" })
vim.keymap.set("n", "<leader>plsp", M.lsp_memory, { desc = "LSP memory" })
vim.keymap.set("n", "<leader>pts", M.treesitter_parsers, { desc = "Treesitter parsers" })

return M