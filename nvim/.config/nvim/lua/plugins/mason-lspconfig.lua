require("mason-lspconfig").setup({
	ensure_installed = {
		"pylsp",
		"lua_ls",
		"ts_ls",
		"eslint",
		"dockerls",
		"docker_compose_language_service",
		"yamlls",
		"bashls",
		"jsonls",
		"tailwindcss",
	},
	automatic_installation = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- -- Python LSP
-- require("lspconfig").basedpyright.setup({
-- 	capabilities = capabilities,
-- 	flags = { debounce_text_changes = 150 },
-- })

-- Lua LSP
require("lspconfig").pylsp.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- TypeScript/JavaScript LSP
require("lspconfig").ts_ls.setup({
	capabilities = capabilities,
})
-- ESLint LSP
require("lspconfig").eslint.setup({
	capabilities = capabilities,
})
-- Tailwind CSS LSP
require("lspconfig").tailwindcss.setup({
	capabilities = capabilities, -- use the same cmp_nvim_lsp capabilities
	filetypes = {             -- only include relevant filetypes
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
})
-- Docker LSP
require("lspconfig").dockerls.setup({
	capabilities = capabilities,
})
-- Docker Compose LSP
require("lspconfig").docker_compose_language_service.setup({
	capabilities = capabilities,
})
-- YAML LSP
require("lspconfig").yamlls.setup({
	capabilities = capabilities,
})
-- Bash LSP
require("lspconfig").bashls.setup({
	capabilities = capabilities,
})
-- JSON LSP
require("lspconfig").jsonls.setup({
	capabilities = capabilities,
})
