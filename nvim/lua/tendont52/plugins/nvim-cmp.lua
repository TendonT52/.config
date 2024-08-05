return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"zbirenbaum/copilot-cmp",
		{
			"MattiasMTS/cmp-dbee",
			dependencies = {
				{ "kndndrj/nvim-dbee" },
			},
			ft = "sql", -- optional but good to have
			opts = {}, -- needed
		},
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
				{ name = "copilot", group_index = 2 },
				{ name = "cmp-dbee" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "spell", option = { keep_all_entries = false } },
				{ name = "path" },
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
