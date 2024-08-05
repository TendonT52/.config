return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "goimports-reviser", "gofumpt", "golines" },
			},
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
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 3000,
			},
		})
	end,
}
