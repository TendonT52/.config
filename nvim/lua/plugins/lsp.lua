return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local signs = { Error = "", Warn = "", Hint = "", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local lspconfig = require("lspconfig")
		    local util = require("lspconfig.util")

			lspconfig.lua_ls.setup({
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using
							version = "LuaJIT",
							-- Setup your lua path
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					})
				end,
				settings = {
					Lua = {},
				},
			})

			-- Function to get the path of the pipenv virtual environment
			local function get_pipenv_python()
				local venv = vim.fn.system("pipenv --venv")
				return venv:gsub("\n", "") .. "/bin/python"
			end
			-- Configure each LSP server
			lspconfig.robotframework_ls.setup({
				root_dir = function(fname)
					return util.root_pattern("robotidy.toml", "pyproject.toml", "conda.yaml", "robot.yaml", "Pipfile")(
						fname
					) or util.find_git_ancestor(fname)
				end,
				cmd = { get_pipenv_python(), "-m", "robotframework_ls" },
				filetypes = { "robot" },
				settings = {
					robot = {
						python = {
							pythonPath = vim.fn.getcwd(),
						},
					},
				},
			})
			lspconfig.pyright.setup({
				cmd = { "pipenv", "run", "pyright-langserver", "--stdio" },
			})

			lspconfig.gopls.setup({
				settings = {
					gopls = {
						analyses = {
							nilness = true,
							unusedwrite = true,
							useany = true,
							unreachable = true,
							unusedparams = true,
							unusedvariable = true,
						},
						staticcheck = true,
						gofumpt = true,
						experimentalPostfixCompletions = true,
						usePlaceholders = true,
					},
				},
			})
		end,
		keys = function()
            -- stylua: ignore
			return {
				{ "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "Go to definition" },
				{ "gi", function() require("telescope.builtin").lsp_implementations() end, desc = "Go to implementation" },
				{ "gr", function() require("telescope.builtin").lsp_references() end, desc = "Go to references" },
				{ "gt", function() require("telescope.builtin").lsp_type_definitions() end, desc = "Go to type definition" },
				{ "K", vim.lsp.buf.hover, desc = "Get information" },
				{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename symbol" },
				{ "<leader>D", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, desc = "List diagnostics" },
				{ "[d", vim.diagnostic.goto_prev, desc = "Previous diagnostic" },
				{ "]d", vim.diagnostic.goto_next, desc = "Next diagnostic" },
				{ "<leader>rs", "<cmd>LspRestart<CR>", desc = "Restart LSP" },
				{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
			}
		end,
	},
}
