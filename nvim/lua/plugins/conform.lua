-- Function to check for deno.json
local function has_deno_json()
	-- Get the current buffer's path
	local bufnr = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(bufnr)

	-- Find the root directory
	local root = vim.fn.fnamemodify(filepath, ":p:h")
	while root ~= "/" do
		local deno_json = root .. "/deno.json"
		if vim.fn.filereadable(deno_json) == 1 then
			return true
		end
		root = vim.fn.fnamemodify(root, ":h")
	end
	return false
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports-reviser", "golines" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			javascript = function()
				if has_deno_json() then
					return { "deno_fmt" }
				end
				return { "prettierd" }
			end,
			javascriptreact = function()
				if has_deno_json() then
					return { "deno_fmt" }
				end
				return { "prettierd" }
			end,
			typescript = function()
				if has_deno_json() then
					return { "deno_fmt" }
				end
				return { "prettierd" }
			end,
			typescriptreact = function()
				if has_deno_json() then
					return { "deno_fmt" }
				end
				return { "prettierd" }
			end,
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
			desc = "Format",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
