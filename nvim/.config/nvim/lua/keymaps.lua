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
vim.api.nvim_set_keymap("n", "<C-d>", "yyp", { noremap = true, silent = true })
-- Select all text
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })
-- Keymap to create a new tab
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
-- Keymap to close the current tab
vim.api.nvim_set_keymap("n", "<C-c>", ":tabclose<CR>", { noremap = true, silent = true })
-- Save the current file
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Undo the last change
vim.api.nvim_set_keymap("n", "<C-z>", ":u<CR>", { noremap = true, silent = true })
-- Move the current line up with Ctrl + Shift + Up Arrow
vim.api.nvim_set_keymap("n", "<C-s-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-s-Up>", ":m'<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move the selected text up with Ctrl + Shift + Up Arrow
vim.api.nvim_set_keymap("n", "<C-s-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-s-Down>", ":m'>+1<CR>gv=gv", { noremap = true, silent = true })
-- Show the error in floating window
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
-- Exit the current buffers
vim.keymap.set("n", "<C-q>", "<Esc>:q<CR>", { noremap = true, silent = true })

-- Keybinding to toggle Git Blame
-- vim.api.nvim_set_keymap("n", "<leader>tb", ":GitBlameToggle<CR>", { noremap = true, silent = true })

-- Undotree keybindings
-- Toogle the Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Docs view keybindings
-- Toggle the Docs View
vim.api.nvim_set_keymap("n", "<leader>dv", ":DocsViewToggle<CR>", { noremap = true, silent = true })

-- NvimTree keybindings
-- Toggle the NvimTree
vim.keymap.set("n", "<C-l>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Telescope keybindings
-- Toggle the Find Files
vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files, {})
-- Toggle the Git Branch View
vim.api.nvim_set_keymap("n", "<leader>gb", ":Telescope git_branches<CR>", { noremap = true, silent = true })
-- Browse between buffers using Telescope
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })
-- Search for a word in the current file
vim.api.nvim_set_keymap(
  "n",
  "<C-f>",
  ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',
  { noremap = true, silent = true }
)

-- CodeCompanion keybindings
vim.keymap.set("n", "<leader>c", ":CodeCompanion<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", ":CodeCompanionActions<CR>", { noremap = true, silent = true })
