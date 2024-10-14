return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				render = "compact",
				stages = "fade",
				timeout = 1000,
				max_width = 80,
				max_height = 20,
			},
		},
	},
	opts = {
		lsp = {
			signature = {
				enabled = false,
			},
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		views = {
			-- Clean cmdline_popup + palette
			cmdline_popup = {
				position = {
					row = 10,
					col = "50%",
				},
				border = {
					style = "none",
					padding = { 1, 1 },
				},
				size = {
					min_width = 60,
					width = "auto",
					height = "auto",
				},
				win_options = {
					winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
				},
			},
			cmdline_popupmenu = {
				relative = "editor",
				position = {
					row = 13,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
					max_height = 15,
				},
				border = {
					style = "none",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "NoiceCmdlinePopupBorder" },
				},
			},
			hover = {
				border = {
					style = "none",
				},
			},
			confirm = {
				border = {
					style = "none",
				},
			},
			popup = {
				border = {
					style = "none",
				},
			},
		},
	},
}
