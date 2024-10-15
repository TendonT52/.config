return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				modules = {},
				auto_install = true,
				sync_install = false,

				ignore_install = {},
				highlight = {
					enable = true,
					disable = function(_, buf)
						local max_filesize = 1000 * 1024 * 3 -- 3 MB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				indent = { enable = true },
				autotag = {
					enable = true,
				},

				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"csv",
					"dockerfile",
					"git_config",
					"git_rebase",
					"gitcommit",
					"gitignore",
					"gitignore",
					"go",
					"gomod",
					"gosum",
					"gotmpl",
					"gowork",
					"graphql",
					"helm",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"prisma",
					"python",
					"query",
					"rust",
					"sql",
					"svelte",
					"terraform",
					"tmux",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
					"zig",
					"robot",
				},

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
							["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },

							["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
							["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

							["ap"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
							["ip"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

							["ab"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
							["ib"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

							["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

							["ai"] = { query = "@call.outer", desc = "Select outer part of a function call/invocation" },
							["ii"] = { query = "@call.inner", desc = "Select inner part of a function call/invocation" },

							["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
							["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },

							["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						},
						include_surrounding_whitespace = true,
					},
					move = {
						enable = true,
						goto_next_start = {
							["]i"] = { query = "@call.outer", desc = "Next function call start" },
							["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]b"] = { query = "@conditional.outer", desc = "Next conditional start" },
							["]l"] = { query = "@loop.outer", desc = "Next loop start" },
							["]p"] = { query = "@parameter.inner", desc = "Next parameter start" },
						},
						goto_next_end = {
							["]I"] = { query = "@call.outer", desc = "Next function call end" },
							["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]B"] = { query = "@conditional.outer", desc = "Next conditional end" },
							["]L"] = { query = "@loop.outer", desc = "Next loop end" },
							["]P"] = { query = "@parameter.inner", desc = "Next parameter end" },
						},
						goto_previous_start = {
							["[i"] = { query = "@call.outer", desc = "Prev function call start" },
							["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
							["[c"] = { query = "@class.outer", desc = "Prev class start" },
							["[b"] = { query = "@conditional.outer", desc = "Prev conditional start" },
							["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
							["[p"] = { query = "@parameter.inner", desc = "Prev parameter start" },
						},
						goto_previous_end = {
							["[I"] = { query = "@call.outer", desc = "Prev function call end" },
							["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
							["[C"] = { query = "@class.outer", desc = "Prev class end" },
							["[B"] = { query = "@conditional.outer", desc = "Prev conditional end" },
							["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
							["[P"] = { query = "@parameter.inner", desc = "Prev parameter end" },
						},
					},
				},
			})
		end,
		keys = function()
			-- Repeat movement with ; and ,
			-- vim way: ; goes to the direction you were moving.
			-- including built in f, F, t, T also repeatable with ; and ,
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
			return {
                -- stylua: ignore
				{ ";", function() return ts_repeat_move.repeat_last_move() end, desc = "Repeat last move", mode = { "n", "x", "o" } },
				{
					",",
					function()
						return ts_repeat_move.repeat_last_move_opposite()
					end,
					desc = "Repeat opposite of last move",
					mode = { "n", "x", "o" },
				},
				{
					"f",
					function()
						return ts_repeat_move.builtin_f_expr()
					end,
					mode = { "n", "x", "o" },
					expr = true,
				},
				{
					"F",
					function()
						return ts_repeat_move.builtin_F_expr()
					end,
					mode = { "n", "x", "o" },
					expr = true,
				},
				{
					"t",
					function()
						return ts_repeat_move.builtin_t_expr()
					end,
					mode = { "n", "x", "o" },
					expr = true,
				},
				{
					"T",
					function()
						return ts_repeat_move.builtin_T_expr()
					end,
					mode = { "n", "x", "o" },
					expr = true,
				},
			}
		end,
	},
}
