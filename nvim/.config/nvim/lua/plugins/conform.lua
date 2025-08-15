-- Code formatter
return {
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
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black", "isort" },
          javascript = { "prettier", stop_after_first = true },
          javascriptreact = { "prettier", stop_after_first = true },
          typescriptreact = { "prettier_d_slim", "prettier", stop_after_first = true },
          typescript = { "prettier_d_slim", "prettier", stop_after_first = true },
          css = { "prettier_d_slim", "prettier" },
          scss = { "prettier_d_slim", "prettier" },
          markdown = { "prettier_d_slim", "prettier" },
          html = { "prettier" },
          json = { "prettier_d_slim", stop_after_first = true },
          yaml = { "prettier" },
          yml = { "prettier" },
          graphql = { "prettier_d_slim", "prettier" },
          md = { "prettier_d_slim", "prettier" },
          txt = { "prettier_d_slim", "prettier" },
          terraform = { "terraform_fmt" },
        },
        formatters = {
          stylua = {
            args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
          },
          yamllint = {
            args = { "yamllint", "--format", "parsable", "--strict", "-" },
          },
          prettier_d_slim = {
            command = "prettier_d_slim",
            args = { "--stdin", "--stdin-filepath", "$FILENAME" },
            require_cwd = true,
          },
          prettier = {
            require_cwd = true,
            cwd = require("conform.util").root_file({
              "package.json",
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.yaml",
              ".prettierrc.json5",
              ".prettierrc.js",
              ".prettierrc.cjs",
              ".prettierrc.mjs",
              ".prettierrc.toml",
              "prettier.config.js",
              "prettier.config.cjs",
              "prettier.config.mjs",
            }),
          },
        },
        -- Set up format-on-save
        -- don't want it formatting with lsp if Prettier isn't available
        format_on_save = { timeout_ms = 1500, lsp_format = "never" },
      })
    end,
  },
}