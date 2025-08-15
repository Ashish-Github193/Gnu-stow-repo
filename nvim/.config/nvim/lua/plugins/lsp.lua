-- LSP Configuration
return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("nvim-lspconfig", category)
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Define a global on_attach function to apply keymaps to all LSPs
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      end

      -- Setup LSP servers manually (no mason-lspconfig to avoid auto-setup conflicts)
      local servers = { "pyright", "dockerls", "lua_ls", "tailwindcss", "ts_ls", "yamlls", "terraformls" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          on_attach = on_attach,
        })
      end
    end,
  },

  -- LSP installer
  {
    "williamboman/mason.nvim",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("mason.nvim", category)
    end,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    cond = function()
      local constraints = require("core.file-size-constraints")
      local category = vim.g.file_size_category or "tiny"
      return constraints.should_enable_plugin("mason-lspconfig.nvim", category)
    end,
  },
}