return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
		})
	end,
    -- stylua: ignore
	keys = {
        { "<leader>hn", function() require("gitsigns").nav_hunk("next") end, desc = "Next hunk" },
		{ "<leader>hN", function() require("gitsigns").nav_hunk("prev") end, desc = "Previous hunk" },
		{ "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
		{ "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
		{ "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
		{ "<leader>hp", function() require("gitsigns").preview_hunk_inline() end, desc = "Preview hunk inline" },
		{ "<leader>bs", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
		{ "<leader>bu", function() require("gitsigns").undo_stage_buffer() end, desc = "Undo stage buffer" },
		{ "<leader>br", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
		{ "<leader>bd", function() require("gitsigns").diffthis() end, desc = "Diff this file" },
	},
}
