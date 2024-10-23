return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local noice = require("noice")

		local lint_progress = function()
			local linters = require("lint").get_running()
			if vim.diagnostic.is_enabled() then
				if #linters == 0 then
					return "󰦕"
				end
				return "󱉶 " .. table.concat(linters, ", ")
			else
				return "󰅙"
			end
		end

		local macro_recording = function()
			local recording_register = vim.fn.reg_recording()
			if recording_register == "" then
				return ""
			else
				return "Recording @" .. recording_register
			end
		end

		-- configure lualine with modified theme
		lualine.setup({
			extensions = { "quickfix", "nvim-dap-ui" },
			options = {
				theme = "catppuccin",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = { "branch" },
				lualine_c = {
					{ "filename", file_status = true, path = 1 },
				},
				lualine_x = {
					{
						macro_recording,
					},
					{
						function()
							return require("dap").status()
						end,
						icon = { " ", color = { fg = "#e7c664" } },
						cond = function()
							if not package.loaded.dap then
								return false
							end
							local session = require("dap").session()
							return session ~= nil
						end,
					},
				},
				lualine_y = {
					{ lint_progress },
					"copilot",
					{ lazy_status.updates, cond = lazy_status.has_updates },
					{ "encoding" },
					{ "filetype" },
				},
				lualine_z = {
					{
						function()
							local starts = vim.fn.line("v")
							local ends = vim.fn.line(".")
							local count = starts <= ends and ends - starts + 1 or starts - ends + 1
							local wc = vim.fn.wordcount()
							return count .. ":" .. wc["visual_chars"]
						end,
						cond = function()
							return vim.fn.mode():find("[Vv]") ~= nil
						end,
					},
					"location",
				},
			},
		})
	end,
}
