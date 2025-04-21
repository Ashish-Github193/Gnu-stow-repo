require("mcphub").setup({
  port = 37373, -- Default port for MCP Hub
  native_servers = {}, -- add your native servers here

  auto_approve = true, -- Auto approve mcp tool calls
  auto_toggle_mcp_servers = true, -- Let LLMs start and stop MCP servers automatically
  extensions = {
    avante = {
      make_slash_commands = true, -- make /slash commands from MCP server prompts
    },
  },

  -- Default window settings
  ui = {
    window = {
      width = 0.8, -- 0-1 (ratio); "50%" (percentage); 50 (raw number)
      height = 0.8, -- 0-1 (ratio); "50%" (percentage); 50 (raw number)
      relative = "editor",
      zindex = 50,
      border = "rounded", -- "none", "single", "double", "rounded", "solid", "shadow"
    },
    wo = { -- window-scoped options (vim.wo)
    },
  },

  -- Event callbacks
  on_ready = function(hub) end,
  on_error = function(err) end,

  --set this to true when using build = "bundled_build.lua"
  use_bundled_binary = false, -- Uses bundled mcp-hub script instead of global installation

  -- Multi-instance Support
  shutdown_delay = 600000, -- Delay in ms before shutting down the server when last instance closes (default: 10 minutes)

  -- Logging configuration
  log = {
    level = vim.log.levels.WARN,
    to_file = false,
    file_path = nil,
    prefix = "MCPHub",
  },
})
