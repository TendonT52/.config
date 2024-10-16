return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"zbirenbaum/copilot-cmp",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview",
			},

			mapping = cmp.mapping.preset.insert({
				["<S-Up>"] = cmp.mapping.scroll_docs(-4),
				["<S-Down>"] = cmp.mapping.scroll_docs(4),
				["<Left>"] = cmp.mapping.abort(),
				["<Right>"] = cmp.mapping.complete(),
				["<S-Tab>"] = cmp.mapping.confirm(),
			}),

			sources = cmp.config.sources({
				{ name = "copilot", group_index = 2, max_item_count = 3 },
				{ name = "nvim_lsp", max_item_count = 5 },
				{ name = "buffer", max_item_count = 3 },
				{ name = "spell", option = { keep_all_entries = false }, max_item_count = 3  },
				{ name = "path" , max_item_count = 3 },
			}),

			sorting = {
				priority_weight = 2,
				comparators = {
					require("copilot_cmp.comparators").prioritize,
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.kind,
				},
			},
		})
	end,
}
