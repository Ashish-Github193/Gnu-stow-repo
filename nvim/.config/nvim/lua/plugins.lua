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
    cond = function()
      return should_load("nvim-treesitter")
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cond = function()
      return should_load("nvim-lspconfig")
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completion source
      "hrsh7th/cmp-buffer", -- Buffer completion source
      "hrsh7th/cmp-path", -- Path completion source
      "saadparwaiz1/cmp_luasnip", -- Snippets source for cmp
    },
  },

  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = function()
      return should_load("indent-blankline.nvim")
    end,
  },

  -- Undo tree
  { "mbbill/undotree" },

  -- Supermaven support
  {
    "supermaven-inc/supermaven-nvim",
    cond = function()
      return should_load("supermaven-nvim")
    end,
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
  },

  -- Advanced text objects and editing
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Smart commenting
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
        ignore = "^$",
        toggler = {
          line = "gcc",
          block = "gbc",
        },
        opleader = {
          line = "gc",
          block = "gb",
        },
        extra = {
          above = "gcO",
          below = "gco",
          eol = "gcA",
        },
      })
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

  -- LSP installer
  {
    "williamboman/mason.nvim",
    cond = function()
      return should_load("mason.nvim")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cond = function()
      return should_load("mason-lspconfig.nvim")
    end,
  },

  -- Themes
  --  { "catppuccin/nvim", name = "catppuccin" },
  --  { "folke/tokyonight.nvim", name = "tokyonight" },
  { "rose-pine/neovim", name = "rose-pine" },

  -- Code formatter
  {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo", "Format" },
    keys = {
      {
        "<leader>mp",
        function()
          require("conform").format()
        end,
        desc = "Format",
      },
    },
  },

  -- Highlight colors
  {
    "brenoprata10/nvim-highlight-colors",
    cond = function()
      return should_load("nvim-highlight-colors")
    end,
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },

  -- Noice (UI enhancements)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = function()
      return should_load("noice.nvim")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    cond = function()
      return should_load("gitsigns.nvim")
    end,
  },

  -- Enhanced git integration
  {
    "sindrets/diffview.nvim",
    cond = function()
      return should_load("diffview.nvim")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup()
    end,
  },

  {
    "NeogitOrg/neogit",
    cond = function()
      return should_load("neogit")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup()
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    cond = function()
      return should_load("lualine.nvim")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Buffer management
  {
    "akinsho/bufferline.nvim",
    cond = function()
      return should_load("bufferline.nvim")
    end,
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "buffer_id",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          themable = true,
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          show_buffer_close_icons = true,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "slant",
          enforce_regular_tabs = false,
          always_show_bufferline = false,
          sort_by = "insert_after_current",
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

  -- UI & Workflow enhancements
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  },

  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
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
