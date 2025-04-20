local plugins = {
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter" },

  -- Git commands in nvim
  { "tpope/vim-fugitive" },

  -- LSP
  { "neovim/nvim-lspconfig" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP completion source
  { "hrsh7th/cmp-buffer" }, -- Buffer completion source
  { "hrsh7th/cmp-path" }, -- Path completion source

  -- Indentation guides
  { "lukas-reineke/indent-blankline.nvim" },

  -- Undo tree
  { "mbbill/undotree" },

  -- Supermaven support
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" }, -- Snippets source for cmp

  -- Searching
  { "BurntSushi/ripgrep" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- LSP installer
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Documentation viewer
  {
    "amrbashir/nvim-docs-view",
    cmd = { "DocsViewToggle" },
    config = function()
      require("docs-view").setup({
        position = "bottom",
        width = 60,
      })
    end,
  },

  -- Themes
  --  { "catppuccin/nvim", name = "catppuccin" },
  --  { "folke/tokyonight.nvim", name = "tokyonight" },
  { "rose-pine/neovim", name = "rose-pine" },

  -- Code formatter
  { "stevearc/conform.nvim" },

  -- Highlight colors
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },

  -- Noice (UI enhancements)
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Git signs
  { "lewis6991/gitsigns.nvim" },

  -- Avante (AI assistant)
  {
    "yetone/avante.nvim",
    branch = "main",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
    config = function()
      require("avante").setup({
        provider = "openai",
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4.1-mini",
          timeout = 30000,
          temperature = 0,
          max_completion_tokens = 16384,
          reasoning_effort = "medium",
        },
      })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup() -- Note: Corrected 'pdashboard' to 'dashboard'
    end,
  },
}

require("lazy").setup(plugins)
