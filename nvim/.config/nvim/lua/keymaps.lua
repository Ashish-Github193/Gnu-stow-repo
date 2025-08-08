-- Editor keybindings
-- Move up
vim.keymap.set("n", "a", "k", { noremap = true })
vim.keymap.set("v", "a", "k", { noremap = true })
-- Move down
vim.keymap.set("n", "f", "j", { noremap = true })
vim.keymap.set("v", "f", "j", { noremap = true })
-- Move left
vim.keymap.set("n", "j", "h", { noremap = true })
vim.keymap.set("v", "j", "h", { noremap = true })
-- Move right
vim.keymap.set("n", ";", "l", { noremap = true })
vim.keymap.set("v", ";", "l", { noremap = true })
-- Duplicate the current line with Ctrl + Shift + D
vim.keymap.set("n", "<C-d>", "yyp", { noremap = true, silent = true })
-- Select all text
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
-- These old tab keybindings are now handled by bufferline below
-- Save the current file
vim.keymap.set("n", "<C-s>", function()
  vim.cmd("write")
end, { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("i", "<C-s>", function()
  vim.cmd("write")
end, { noremap = true, silent = true, desc = "Save file" })
-- Alternative save keymap if Ctrl-S doesn't work
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file (alternative)" })
-- Undo the last change
vim.keymap.set("n", "<C-z>", ":u<CR>", { noremap = true, silent = true })
-- Move the current line up with Ctrl + Shift + Up Arrow
vim.keymap.set("n", "<C-s-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s-Up>", ":m'<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move the selected text up with Ctrl + Shift + Up Arrow
vim.keymap.set("n", "<C-s-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s-Down>", ":m'>+1<CR>gv=gv", { noremap = true, silent = true })
-- Show the error in floating window
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
-- Exit the current buffers
vim.keymap.set("n", "<C-q>", function()
  require("codewindow").close_minimap()
  vim.cmd("q")
end, { noremap = true, silent = true })

-- Keybinding to toggle Git Blame
-- vim.keymap.set("n", "<leader>tb", ":GitBlameToggle<CR>", { noremap = true, silent = true })

-- Undotree keybindings
-- Toogle the Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Docs view keybindings
vim.keymap.set("n", "<leader>dv", ":DocsViewToggle<CR>", { noremap = true, silent = true })

-- Neo-tree keybindings
vim.keymap.set("n", "<C-o>", ":Neotree float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nt", ":Neotree<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nf", ":Neotree focus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nb", ":Neotree buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ng", ":Neotree git_status<CR>", { noremap = true, silent = true })

-- Telescope keybindings
vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<C-f>",
  ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',
  { noremap = true, silent = true }
)

-- Flash keybindings
vim.keymap.set({ "n", "x", "o" }, "s", require("flash").jump, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", require("flash").treesitter, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", require("flash").remote, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", require("flash").treesitter_search, { desc = "Treesitter Search" })

-- Git keybindings
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true })

-- Buffer navigation with bufferline
vim.keymap.set("n", "<C-PageDown>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", ":enew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ba", ":bufdo bdelete<CR>", { noremap = true, silent = true })

-- Performance monitoring keybindings
vim.keymap.set("n", "<leader>lazy", ":Lazy<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>health", ":checkhealth<CR>", { noremap = true, silent = true })

-- Commenting keybindings (VS Code style)
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Toggle comment" })

-- File size constraints
-- <leader>fs is defined in file-size-constraints.lua
local osc52 = require("osc52")
vim.keymap.set("n", "<leader>y", osc52.copy_operator, { expr = true, desc = "OSC52: Yank motion" })
vim.keymap.set("n", "<leader>Y", function()
  osc52.copy_operator()
  return "V"
end, { expr = true, desc = "OSC52: Yank current line" })
vim.keymap.set("v", "<leader>y", osc52.copy_visual, { desc = "OSC52: Yank visual selection" })

-- UFO folding keymaps
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with" })
vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek folded lines" })
vim.keymap.set("n", "<leader>zf", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
vim.keymap.set("n", "<leader>zc", require("ufo").closeFoldsWith, { desc = "Close folds with" })

-- Auto-close minimap on quit events
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    require("codewindow").close_minimap()
  end,
})
