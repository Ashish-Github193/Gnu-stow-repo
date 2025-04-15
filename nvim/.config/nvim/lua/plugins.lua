require("packer").startup(function(use)
  use("wbthomason/packer.nvim") -- Package manager
  use("nvim-treesitter/nvim-treesitter") -- Syntax highlighting
  use("tpope/vim-fugitive") -- Git commands in nvim
  use("neovim/nvim-lspconfig") -- LSP
  use("hrsh7th/nvim-cmp") -- Autocompletion
  use("hrsh7th/cmp-nvim-lsp") -- LSP completion source
  use("hrsh7th/cmp-buffer") -- Buffer completion source
  use("hrsh7th/cmp-path") -- Path completion source
  use("lukas-reineke/indent-blankline.nvim")
  use("mbbill/undotree")
  use({
    "supermaven-inc/supermaven-nvim", -- Maven support
    config = function()
      require("supermaven-nvim").setup({})
    end,
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use("L3MON4D3/LuaSnip") -- Snippets
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for cmp
  use("BurntSushi/ripgrep") -- Searching
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- Searching
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({
    "nvim-tree/nvim-tree.lua", -- File explorer
    requires = { "nvim-tree/nvim-web-devicons" },
  })
  use({ "williamboman/mason.nvim" }) -- LSP installer
  use({ "williamboman/mason-lspconfig.nvim" }) -- LSP installer
  use({
    "amrbashir/nvim-docs-view", -- Documentation viewer
    opt = true,
    cmd = { "DocsViewToggle" },
    config = function()
      require("docs-view").setup({
        position = "bottom",
        width = 60,
      })
    end,
  })
  use({ "catppuccin/nvim", as = "catppuccin" }) -- Theme
  use({ "folke/tokyonight.nvim", as = "tokyonight" }) -- Theme
  use("stevearc/conform.nvim") -- Code formatter
  use({
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  })
  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim", -- UI components
      "rcarriga/nvim-notify", -- Fancy notifications (optional)
    },
  })
  use({ "lewis6991/gitsigns.nvim" })
  use({
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  })
  use({
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    requires = { "nvim-tree/nvim-web-devicons" }, -- icons for dashboard
    config = function()
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
              desc = "Find File",
              desc_hl = "String",
              key = "f",
              key_hl = "Number",
              action = "Telescope find_files",
            },
            {
              icon = "🔍",
              desc = "Find Word",
              key = "w",
              action = "Telescope live_grep",
            },
            {
              icon = "🕘",
              desc = "Recent Files",
              key = "r",
              action = "Telescope oldfiles",
            },
            {
              icon = "📁",
              desc = "Projects",
              key = "p",
              action = "Telescope projects",
            },
            {
              icon = "🛠️",
              desc = "Edit Config",
              key = "c",
              action = "edit ~/.config/nvim/init.lua",
            },
            {
              icon = "🚪",
              desc = "Quit",
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
    end,
  })
end)
