require("mason").setup()

local servers = {
  "ast_grep",
  "basedpyright",
  "dockerls",
  "lua_ls",
  "tailwindcss",
  "ts_ls",
  "yamlls",
  "terraformls",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local lspconfig = require("lspconfig")

-- Define a global on_attach function to apply keymaps to all LSPs
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

-- Setup LSP servers with the global on_attach function
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
  })
end
