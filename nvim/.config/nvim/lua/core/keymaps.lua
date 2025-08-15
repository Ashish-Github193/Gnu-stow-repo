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
vim.keymap.set("n", "<C-o>", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nt", ":Neotree<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nf", ":Neotree focus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nb", ":Neotree buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ng", ":Neotree git_status<CR>", { noremap = true, silent = true })

-- Telescope keybindings (moved to telescope plugin file for proper lazy loading)

-- Flash keybindings (moved to flash plugin file for proper lazy loading)

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

-- OSC52 keymaps (moved to utilities plugin for proper lazy loading)

-- UFO folding keymaps (moved to utilities plugin for proper lazy loading)

-- Auto-close minimap on quit events
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    require("codewindow").close_minimap()
  end,
})
