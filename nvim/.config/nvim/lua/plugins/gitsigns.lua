require("gitsigns").setup({
	signcolumn = true, -- show signs in the sign column
	numhl = true,   -- disable number highlight
	linehl = false, -- disable line highlight
	word_diff = false, -- disable word diff
	watch_gitdir = {
		follow_files = true,
	},
	on_attach = function(bufnr)
		local gs = require("gitsigns")
		local function map(mode, lhs, rhs, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Navigation between hunks
		map("n", "]c", function()
			gs.next_hunk()
		end)
		map("n", "[c", function()
			gs.prev_hunk()
		end)

		-- Actions: stage/reset
		map("n", "<leader>gs", gs.stage_hunk)
		map("v", "<leader>gs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>gr", gs.reset_hunk)
		map("v", "<leader>gr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		-- Preview diff for hunk
		map("n", "<leader>gp", gs.preview_hunk)

		-- Toggle blame (if needed later)
		map("n", "<leader>gB", function()
			gs.blame_line({ full = true })
		end)
	end,
})
