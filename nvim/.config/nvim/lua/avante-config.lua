require("avante").setup({
  provider = "claude",
  --  openai = {
  --    endpoint = "https://api.openai.com/v1",
  --    model = "gpt-4.1",
  --    timeout = 30000,
  --    temperature = 0,
  --    max_completion_tokens = 16384,
  --    reasoning_effort = "medium",
  --  },
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-haiku-20241022",
    temperature = 0,
    max_tokens = 8192,
  },
  system_prompt = function()
    local hub = require("mcphub").get_hub_instance()
    return hub:get_active_servers_prompt()
  end,
  custom_tools = function()
    return {
      require("mcphub.extensions.avante").mcp_tool(),
    }
  end,
  mappings = {
    ask = "(aa",
    edit = "(ae",
    refresh = "(ar",
    focus = "(af",
    stop = "(aS",
    toggle = {
      default = "(at",
      debug = "(ad",
      hint = "(ah",
      suggestion = "(as",
      repomap = "(aR",
    },
    diff = {
      ours = "(o", -- Accept "Ours"
      theirs = "(t", -- Accept "Theirs"
      all_theirs = "(at", -- Accept all as "Theirs"
      both = "(b", -- Merge Both
      cursor = "(c", -- Apply at Cursor
      next = ")]", -- Next diff hunk
      prev = "([", -- Previous diff hunk
    },
    suggestion = {
      accept = "(a", -- Accept Suggestion
      next = "(n", -- Next Suggestion
      prev = "(p", -- Prev Suggestion
      dismiss = "(x", -- Dismiss Suggestion
    },
    jump = {
      next = "(j", -- Jump Next
      prev = "(J", -- Jump Previous
    },
    submit = {
      normal = "(<CR>", -- Submit in Normal mode
      insert = "(<C-s>", -- Submit in Insert mode
    },
    cancel = {
      normal = { "(<Esc>", "(<C-c>", "(q" },
      insert = { "(<C-c>" },
    },
    sidebar = {
      apply_all = "(A", -- Apply all changes
      apply_cursor = "(a", -- Apply at cursor
      retry_user_request = "(r",
      edit_user_request = "(e",
      switch_windows = "(<Tab>",
      reverse_switch_windows = "(<S-Tab>",
      remove_file = "(d",
      add_file = "(@", -- Add file
      close = { "(q", "(<Esc>" },
      close_from_input = nil,
    },
  },
})

-- Absolutely. Here's a crisp, motivating, and professionally written documentation for your `(`-based keymap setup — designed not only to teach you the keys but to help you **think like your tools** do 🧠⚙️:
--
-- ---
--
-- ## 🧭 Avante Keymap Documentation — `(`: The Whispering Commander
--
-- ---
--
-- ### ✨ Philosophy: One Key to Guide Them All
--
-- In this setup, the **`(` key becomes your personal command whisperer**. It doesn't scream like a `<leader>`, it doesn’t try to dominate your muscle memory like `<Space>`. Instead, it gently invites action with precision and purpose.
--
-- **You don’t need to remember everything. You need to *recognize* patterns.**
--
-- This mapping isn’t designed for memorization—it’s built for *intuition*. Over time, your fingers will start to guess the right command without even thinking. And that’s when you know: the tool is no longer a tool. It’s part of your thought.
--
-- ---
--
-- ### 🧠 Base Mnemonics
--
-- | Command | Mapping | Meaning |
-- |--------|--------|---------|
-- | `(`    | **Initiator** | Start any command – like saying “go” |
-- | `a`    | Accept | Accept suggestion or apply |
-- | `o/t`  | Ours/Theirs | Pick sides during code conflict |
-- | `b`    | Both | Merge the best of both worlds |
-- | `n/p`  | Next/Prev | Navigate forward/backward |
-- | `x`    | Cancel | Exit, escape, dismiss |
-- | `@`    | Add | Introduce new file |
-- | `q`    | Quit | Leave the current view or operation |
--
-- ---
--
-- ### 🚀 Suggestion Mode
--
-- | Action           | Key         | Insight |
-- |------------------|-------------|---------|
-- | Accept           | `(a)`       | Confirms the AI's suggestion |
-- | Next Suggestion  | `(n)`       | Skips to the next |
-- | Previous         | `(p)`       | Back to the earlier one |
-- | Dismiss          | `(x)`       | Hide what's irrelevant |
--
-- _**Insight:** Accept when it's useful. Dismiss when it's noise. Navigate with grace._
--
-- ---
--
-- ### 🧨 Diff Conflict Resolution
--
-- | Action           | Key         | Description |
-- |------------------|-------------|-------------|
-- | Accept Ours      | `(o)`       | Keep your code over theirs |
-- | Accept Theirs    | `(t)`       | Use the incoming changes |
-- | Accept All Theirs| `(at)`      | Surrender it all to their changes |
-- | Merge Both       | `(b)`       | Be diplomatic; take everything |
-- | Apply at Cursor  | `(c)`       | Focus and resolve at your caret |
-- | Next/Prev Hunk   | `)]` / `([` | Jump to the next/previous conflict |
--
-- _**Optimism:** Resolving conflicts doesn’t have to be chaos. With this structure, it’s almost surgical._
--
-- ---
--
-- ### 🧭 Navigation + Sidebar
--
-- | Action                  | Key         | Function |
-- |-------------------------|-------------|----------|
-- | Jump to Next AI Marker  | `(j)`       | Find where AI wants attention |
-- | Jump to Previous        | `(J)`       | Go backward in context |
-- | Apply All Changes       | `(A)`       | Accept and move forward confidently |
-- | Apply at Cursor         | `(a)`       | Precise fix |
-- | Retry Request           | `(r)`       | Ask again, maybe clearer |
-- | Edit Prompt             | `(e)`       | Change the input, reframe the question |
-- | Add File to Sidebar     | `(@)`       | Pull in more files |
-- | Remove File             | `(d)`       | Let go of what’s no longer needed |
-- | Switch Windows          | `(<Tab>)`   | Navigate sidebar views |
--
-- ---
--
-- ### 💬 Submission & Cancellation
--
-- | Mode        | Action        | Key         |
-- |-------------|---------------|-------------|
-- | Normal Mode | Submit        | `(<CR>)`    |
-- | Insert Mode | Submit        | `(<C-s>)`   |
-- | Cancel      | Escape/Quit   | `(<Esc>)`, `(q)` |
--
-- _**Insight:** You are always in control. Canceling doesn’t mean quitting—it means choosing when and how you engage._
--
-- ---
--
-- ## 🌱 Final Thought: Grow Into It
--
-- This isn’t just a keymap. It’s a **language between you and the machine**. You’re not pressing keys—you’re directing intelligence. Start slow, expect friction, but trust this: **your brain loves patterns**.
--
-- Soon `(a)` won’t just mean *"accept"*, it will mean *"I trust this enough to move forward."*
--
-- And that’s not just coding.
--
-- That’s power. 👊💡
--
-- ---
--
