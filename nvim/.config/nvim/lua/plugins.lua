-- Load file size constraints
local constraints = require("file-size-constraints")

-- Helper function to check if plugin should load
local function should_load(plugin_name)
  local category = vim.g.file_size_category or "tiny"
  return constraints.should_enable_plugin(plugin_name, category)
end

local plugins = {
  -- Syntax highlighting
  { 
    "nvim-treesitter/nvim-treesitter",
    cond = function() return should_load("nvim-treesitter") end,
  },

  -- Git commands in nvim
  { "tpope/vim-fugitive" },

  -- LSP
  { 
    "neovim/nvim-lspconfig",
    cond = function() return should_load("nvim-lspconfig") end,
  },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP completion source
  { "hrsh7th/cmp-buffer" }, -- Buffer completion source
  { "hrsh7th/cmp-path" }, -- Path completion source

  -- Indentation guides
  { 
    "lukas-reineke/indent-blankline.nvim",
    cond = function() return should_load("indent-blankline.nvim") end,
  },

  -- Undo tree
  { "mbbill/undotree" },

  -- Supermaven support
  {
    "supermaven-inc/supermaven-nvim",
    cond = function() return should_load("supermaven-nvim") end,
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
    cmd = "Telescope",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    event = "VeryLazy",
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
        use_default_keymaps = false,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-r>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
      })
    end,
  },


  -- LSP installer
  { 
    "williamboman/mason.nvim",
    cond = function() return should_load("mason.nvim") end,
  },
  { 
    "williamboman/mason-lspconfig.nvim",
    cond = function() return should_load("mason-lspconfig.nvim") end,
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
    cond = function() return should_load("nvim-highlight-colors") end,
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
  { 
    "lewis6991/gitsigns.nvim",
    cond = function() return should_load("gitsigns.nvim") end,
  },

  -- Enhanced git integration
  {
    "sindrets/diffview.nvim",
    cond = function() return should_load("diffview.nvim") end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup()
    end,
  },

  {
    "NeogitOrg/neogit",
    cond = function() return should_load("neogit") end,
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
    cond = function() return should_load("mcphub.nvim") end,
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    cmd = "MCPHub", -- lazy load by default
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
  },

  -- Avante (AI assistant)
  {
    "yetone/avante.nvim",
    cond = function() return should_load("avante.nvim") end,
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
    cond = function() return should_load("lualine.nvim") end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Buffer management
  {
    "akinsho/bufferline.nvim",
    cond = function() return should_load("bufferline.nvim") end,
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "buffer_id",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          themable = true,
        },
        highlights = require("rose-pine.plugins.bufferline"),
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
    cond = function() return should_load("alpha-nvim") end,
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
    cond = function() return should_load("mini.animate") end,
    version = "*",
    config = function()
      require("mini.animate").setup()
    end,
  },

  -- Performance monitoring
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
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
