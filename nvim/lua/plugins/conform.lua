return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports-reviser", "golines" },
		},

		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- Customize formatters
		formatters = {
			goimports_reviser = {
				command = "goimports-reviser",
				args = {
					"-imports-order std,general,company,project,blanked,dotted",
					"-company-prefixes",
					"-format",
					"$FILENAME",
				},
				stdin = false,
			},
		},
	},
	keys = {
		{
			"<leader>cf",
			function()
				if vim.bo.modified then
					vim.cmd("write")
				end
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
