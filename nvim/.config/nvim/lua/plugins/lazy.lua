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
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	-- Telescope for fuzzy finding
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	-- Filemanger for nvim
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x", -- or tag = "v3.x" if you want a specific release
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional but recommended
		},
	},
	-- All language formatters
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
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
	{ "brenoprata10/nvim-highlight-colors" },
})
