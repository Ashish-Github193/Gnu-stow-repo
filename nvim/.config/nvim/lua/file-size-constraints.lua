-- File size-based plugin constraints
local M = {}

-- Size thresholds in bytes
M.thresholds = {
  small = 100 * 1024,     -- 100 KB
  medium = 500 * 1024,    -- 500 KB  
  large = 1024 * 1024,    -- 1 MB
  huge = 5 * 1024 * 1024, -- 5 MB
}

-- Get file size in bytes
M.get_file_size = function(filepath)
  if not filepath or filepath == "" then
    return 0
  end
  
  local stat = vim.loop.fs_stat(filepath)
  if stat then
    return stat.size
  end
  return 0
end

-- Determine file size category
M.get_size_category = function(size)
  if size < M.thresholds.small then
    return "tiny"
  elseif size < M.thresholds.medium then
    return "small"
  elseif size < M.thresholds.large then
    return "medium"
  elseif size < M.thresholds.huge then
    return "large"
  else
    return "huge"
  end
end

-- Check if plugin should be enabled for given file size
M.should_enable_plugin = function(plugin_name, size_category)
  local constraints = {
    tiny = {}, -- No restrictions
    small = { "profile_heavy" }, -- Start profiling
    medium = { "disable_heavy" }, -- Disable Treesitter, LSP, AI
    large = { "disable_most" }, -- Minimal setup
    huge = { "view_mode" }, -- View only
  }
  
  local heavy_plugins = {
    "nvim-treesitter",
    "nvim-lspconfig", 
    "mason.nvim",
    "mason-lspconfig.nvim",
    "avante.nvim",
    "supermaven-nvim",
    "mcphub.nvim",
  }
  
  local most_plugins = {
    "gitsigns.nvim",
    "diffview.nvim",
    "neogit",
    "indent-blankline.nvim",
    "nvim-highlight-colors",
    "mini.animate",
    "bufferline.nvim",
    "lualine.nvim",
    "alpha-nvim",
  }
  
  local constraint = constraints[size_category] or {}
  
  if vim.tbl_contains(constraint, "view_mode") then
    -- Only allow essential plugins
    local essential = {
      "lazy.nvim",
      "plenary.nvim", 
      "nvim-web-devicons",
      "rose-pine",
    }
    return vim.tbl_contains(essential, plugin_name)
  elseif vim.tbl_contains(constraint, "disable_most") then
    -- Disable most plugins except basic ones
    local allowed = {
      "lazy.nvim",
      "plenary.nvim",
      "nvim-web-devicons", 
      "rose-pine",
      "nvim-tree.lua",
      "telescope.nvim",
      "telescope-fzf-native.nvim",
      "oil.nvim",
      "undotree",
      "vim-fugitive",
    }
    return vim.tbl_contains(allowed, plugin_name)
  elseif vim.tbl_contains(constraint, "disable_heavy") then
    -- Disable heavy plugins
    return not vim.tbl_contains(heavy_plugins, plugin_name)
  end
  
  return true -- No restrictions for tiny/small files
end

-- Display current constraints
M.show_constraints = function()
  local current_file = vim.fn.expand("%:p")
  local size = M.get_file_size(current_file)
  local category = M.get_size_category(size)
  
  local size_mb = size / (1024 * 1024)
  
  print(string.format("=== FILE SIZE CONSTRAINTS ==="))
  print(string.format("File: %s", vim.fn.expand("%:t")))
  print(string.format("Size: %.2f MB (%d bytes)", size_mb, size))
  print(string.format("Category: %s", category))
  
  local messages = {
    tiny = "✅ No restrictions - all plugins enabled",
    small = "⚠️  Profiling mode - monitoring performance", 
    medium = "🚫 Heavy plugins disabled (Treesitter, LSP, AI)",
    large = "🚫 Minimal mode - only essential plugins",
    huge = "👁️  View mode - plugins disabled for performance",
  }
  
  print(string.format("Status: %s", messages[category] or "Unknown"))
end

-- Auto-command to check file size on buffer enter
M.setup_autocmd = function()
  vim.api.nvim_create_autocmd({"BufEnter", "BufRead"}, {
    callback = function()
      local current_file = vim.fn.expand("%:p")
      local size = M.get_file_size(current_file)
      local category = M.get_size_category(size)
      
      -- Show warning for large files
      if category == "medium" then
        vim.notify("Large file detected. Heavy plugins disabled for performance.", vim.log.levels.WARN)
      elseif category == "large" then
        vim.notify("Very large file detected. Minimal mode enabled.", vim.log.levels.WARN)  
      elseif category == "huge" then
        vim.notify("Huge file detected. View-only mode enabled.", vim.log.levels.ERROR)
      end
      
      -- Store category globally for other modules
      vim.g.file_size_category = category
    end,
  })
end

-- Keymap to check current constraints
vim.keymap.set("n", "<leader>fs", M.show_constraints, { 
  desc = "Show file size constraints",
  noremap = true, 
  silent = true 
})

return M