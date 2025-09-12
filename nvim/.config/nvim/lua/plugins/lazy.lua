require("lazy").setup({
	-- Utility library
	{ "nvim-lua/plenary.nvim" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- command-line completions
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"L3MON4D3/LuaSnip", -- snippet engine
		},
	},
	-- Treesitter for syntax highlighting & code parsing
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	-- FZF native plugin for telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	-- Filemanger for nvim
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
	},
	-- All language formatters
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	-- Mason itself
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	-- Mason LSP Config
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	},
	{
		"ojroques/nvim-osc52",
		config = function()
			require("osc52").setup()
		end,
	},
	-- Undo tree visualizer
	{
		"mbbill/undotree",
	},
	-- AI code completion
	{
		"supermaven-inc/supermaven-nvim",
	},
	{
		"brenoprata10/nvim-highlight-colors",
	},
	{
		"nvimdev/dashboard-nvim",
	},
	{ "folke/tokyonight.nvim" },
})
