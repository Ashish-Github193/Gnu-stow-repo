-- ~/.config/nvim/lua/dashboard_config.lua
local M = {}

M.setup = function()
  require("dashboard").setup({
    theme = "doom",
    config = {
      header = {
        "",
        " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
        " ████╗  ██║██║   ██║██║████╗ ████║",
        " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
        " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
        " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
        "    [ Code. Think. Destroy. Repeat. ]",
        "",
      },
      center = {
        {
          icon = "📂",
          icon_hl = "Title",
          desc = " Find File",
          desc_hl = "String",
          key = "f",
          key_hl = "Number",
          action = "Telescope find_files",
        },
        {
          icon = "🔍",
          desc = " Find Word",
          key = "w",
          action = "Telescope live_grep",
        },
        {
          icon = "🕘",
          desc = " Recent Files",
          key = "r",
          action = "Telescope oldfiles",
        },
        {
          icon = "📁",
          desc = " Projects",
          key = "p",
          action = "Telescope projects",
        },
        {
          icon = "🛠️",
          desc = " Edit Config",
          key = "c",
          action = "edit ~/.config/nvim/init.lua",
        },
        {
          icon = "🚪",
          desc = " Quit",
          key = "q",
          action = "qa",
        },
      },
      footer = {
        "",
        "⚡ Neovim loaded. Ready to dominate. ⚡",
      },
    },
  })
end

return M
