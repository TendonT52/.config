return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "List buffers",
		},
		{
			"<leader>fm",
			function()
				local action_state = require("telescope.actions.state")
				local actions = require("telescope.actions")

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Modified Buffers",
						finder = require("telescope.finders").new_table({
							results = vim.tbl_filter(function(buf)
								return vim.api.nvim_buf_get_option(buf, "modified")
							end, vim.api.nvim_list_bufs()),
							entry_maker = function(buf)
								local filename = vim.api.nvim_buf_get_name(buf)
								filename = vim.fn.fnamemodify(filename, ":p:~:.")
								return {
									value = buf,
									display = string.format("%d: %s", buf, filename),
									ordinal = filename,
								}
							end,
						}),
						sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
						attach_mappings = function(prompt_bufnr, map)
							actions.select_default:replace(function()
								local selection = action_state.get_selected_entry()
								actions.close(prompt_bufnr)
								vim.api.nvim_set_current_buf(selection.value)
							end)
							return true
						end,
					})
					:find()
			end,
			desc = "List modified buffers",
		},
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find file",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "List recent files",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Find string",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics({
					severity_limit = vim.diagnostic.severity.WARN, -- This will show only ERROR and WARN
				})
			end,
			desc = "List diagnostics",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Find string under cursor",
		},
		{
			"<leader>gm",
			require("telescope.builtin").git_status,
			desc = "Open modified file",
		},
		{
			"<leader>gb",
			require("telescope.builtin").git_branches,
			desc = "Checkout branch",
		},
		{
			"<leader>gc",
			require("telescope.builtin").git_commits,
			desc = "Checkout commit",
		},
		{
			"<leader>gC",
			require("telescope.builtin").git_bcommits,
			desc = "Checkout commit(for current file)",
		},
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				border = true,
				layout_config = {
					horizontal = {
						size = {
							width = "90%",
							height = "60%",
						},
					},
					vertical = {
						size = {
							width = "90%",
							height = "90%",
						},
					},
				},
			},

			extensions = {
				fzf = {
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}
