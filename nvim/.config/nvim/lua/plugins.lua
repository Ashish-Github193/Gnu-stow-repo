-- Collect all plugin specs from plugin files
local plugins = {}

-- List of all plugin files to load
local plugin_files = {
  "comment",
  "surround",
  "flash",
  "autopairs",
  "telescope",
  "neotree",
  "trouble",
  "gitsigns",
  "lsp",
  "treesitter",
  "completion",
  "indent",
  "conform",
  "noice",
  "lualine",
  "autosession",
  "theme",
  "git",
  "ui",
  "utilities"
}

-- Load each plugin file and collect their specs
for _, plugin_file in ipairs(plugin_files) do
  local ok, plugin_spec = pcall(require, "plugins." .. plugin_file)
  if ok and plugin_spec then
    if type(plugin_spec) == "table" then
      -- If it's a table, add all specs to the main plugins table
      for _, spec in ipairs(plugin_spec) do
        table.insert(plugins, spec)
      end
    end
  else
    vim.notify("Failed to load plugin file: " .. plugin_file, vim.log.levels.WARN)
  end
end

require("lazy").setup(plugins)
