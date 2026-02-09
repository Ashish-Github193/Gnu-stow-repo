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
		map("n", "<leader>gr", gs.reset_hunk)

		-- Preview diff for hunk
		map("n", "<leader>gp", gs.preview_hunk)

		-- Toggle blame (if needed later)
		map("n", "<leader>gB", function()
			gs.blame_line({ full = true })
		end)
	end,
})
