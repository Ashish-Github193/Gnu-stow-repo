require("codecompanion").setup({
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        schema = { model = { default = "gpt-4.1-mini" } },
        env = {
          api_key = os.getenv("OPENAI_API_KEY"),
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "openai",
      keymaps = {
        send = {
          modes = { n = "<c-CR>", i = "<C-CR>" },
        },
        close = {
          modes = { n = "<cq>", i = "<cq>" },
        },
      },
    },
    inline = {
      adapter = "openai",
      keymaps = {
        accept_change = {
          modes = { n = "ga" },
          description = "Accept the suggested change",
        },
        reject_change = {
          modes = { n = "gr" },
          description = "Reject the suggested change",
        },
      },
    },
    agent = { adapter = "openai" },
  },
})
