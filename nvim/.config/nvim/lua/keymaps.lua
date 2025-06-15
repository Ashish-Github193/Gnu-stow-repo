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
-- Keymap to create a new tab
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
-- Keymap to close the current tab
vim.keymap.set("n", "<C-c>", ":tabclose<CR>", { noremap = true, silent = true })
-- Switch to the previous tab (Ctrl + PageUp)
vim.keymap.set("n", "<C-PageUp>", ":tabnext -1<CR>:NvimTreeRefresh<CR>", { noremap = true, silent = true })
-- Switch to the next tab (Ctrl + PageDown)
vim.keymap.set("n", "<C-PageDown>", ":tabnext +1<CR>:NvimTreeRefresh<CR>", { noremap = true, silent = true })
-- Save the current file
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
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
vim.keymap.set("n", "<C-q>", "<Esc>:q<CR>", { noremap = true, silent = true })

-- Keybinding to toggle Git Blame
-- vim.keymap.set("n", "<leader>tb", ":GitBlameToggle<CR>", { noremap = true, silent = true })

-- Undotree keybindings
-- Toogle the Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Docs view keybindings
vim.keymap.set("n", "<leader>dv", ":DocsViewToggle<CR>", { noremap = true, silent = true })

-- NvimTree keybindings
vim.keymap.set("n", "<C-l>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

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

-- CodeCompanion keybindings
vim.keymap.set("n", "<leader>c", ":CodeCompanion<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", ":CodeCompanionActions<CR>", { noremap = true, silent = true })

-- Oil keybindings
vim.keymap.set("n", "<leader>o", ":Oil<CR>", { noremap = true, silent = true })

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
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { noremap = true, silent = true })
