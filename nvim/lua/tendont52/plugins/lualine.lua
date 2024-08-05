return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "catppuccin",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{ "filename", file_status = true, path = 1 },
				},
				lualine_x = {
					"copilot",
					{ lazy_status.updates, cond = lazy_status.has_updates },
					{ "encoding" },
					{ "filetype" },
				},
				lualine_y = { "progress" },
			},
		})
	end,
}
