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

  -- Advanced text objects and editing
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("flash").setup()
    end,
  },

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

  -- Enhanced file management
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
        },
      })
    end,
  },

  -- Quick file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
  },

  -- LSP installer
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

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

  -- Enhanced git integration
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup()
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup()
    end,
  },

  -- MCPHub
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    cmd = "MCPHub", -- lazy load by default
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
  },

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
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Buffer management
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "buffer_id",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
        },
      })
    end,
  },

  -- Session management
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      })
    end,
  },

  -- Alpha (dashboard replacement)
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
  },

  -- UI & Workflow enhancements
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },

  {
    "echasnovski/mini.animate",
    version = "*",
    config = function()
      require("mini.animate").setup()
    end,
  },

  --  {
  --    "iamcco/markdown-preview.nvim",
  --    build = "cd app && npm install",
  --    ft = { "markdown" },
  --    config = function()
  --      vim.g.mkdp_auto_start = 1 -- auto open preview
  --    end,
  --  },
}

require("lazy").setup(plugins)
