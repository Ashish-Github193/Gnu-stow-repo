-- Yank a visual selection
vim.keymap.set("v", "<leader>y", function()
	require("osc52").copy_visual()
end, { desc = "OSC52: Yank visual selection" })

-- Duplicate the current line with Ctrl + Shift + D
vim.keymap.set("n", "<C-d>", "yyp", { noremap = true, silent = true })

-- Select all text
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Save the current file
vim.keymap.set("n", "<C-s>", function()
	vim.cmd("write")
end, { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("i", "<C-s>", function()
	vim.cmd("write")
end, { noremap = true, silent = true, desc = "Save file" })

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

-- NeoTree keymaps
vim.keymap.set("n", "<C-o>", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Telescope keymaps
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
vim.keymap.set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

-- Commenting keybindings (VS Code style)
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Toggle comment" })

-- Undo tree keymap
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle undo tree" })

-- Supermaven keymaps
vim.keymap.set(
	"n",
	"<leader>sm",
	":SupermavenToggle<CR>",
	{ noremap = true, silent = true, desc = "Toggle Supermaven" }
)
