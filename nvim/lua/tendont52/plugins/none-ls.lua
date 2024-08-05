return {
	"nvimtools/none-ls.nvim",
	dependencies = { "mason.nvim", "davidmh/cspell.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		local null_ls = require("null-ls")
		local cspell = require("cspell")

		local sources = {
			cspell.diagnostics.with({
				diagnostics_postprocess = function(diagnostic)
					diagnostic.severity = vim.diagnostic.severity.HINT
				end,
				condition = function(utils)
					return vim.bo.modifiable
				end,
			}),
			cspell.code_actions.with({
				condition = function(utils)
					return vim.bo.modifiable
				end,
			}),
			null_ls.builtins.code_actions.gomodifytags,
			null_ls.builtins.code_actions.impl,
			null_ls.builtins.diagnostics.golangci_lint.with({
				args = {
					"run",
					"--presets=bugs,error,format,style,performance,sql,unused",
					"--fix=false",
					"--out-format=json",
				},
			}),
		}
		-- Define the debounce value
		local debounce_value = 200
		return {
			sources = sources,
			debounce = debounce_value,
			debug = true,
		}
	end,
}
