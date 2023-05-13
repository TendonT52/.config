return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "f3fora/cmp-spell",
    },
    opts = function()
      local cmp = require("cmp")
      -- Use buffer source for `/`
      cmp.setup.cmdline("/", {
        sources = {
          { name = "buffer", keyword_length = 2 },
        },
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline", max_item_count = 6, keyword_length = 2 },
        }),
      })
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              buffer = "[BUF]",
              path = "[PAT]",
              spell = "[SPL]",
              cmdline = "[CMD]",
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = {
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
          ["<C-S-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-S-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-l>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, })
            else
              cmp.complete()
            end
          end, { "i", "c" }),
          ["<C-h>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          {
            name = "spell",
            group_index = 1,
            keyword_length = 3,
            entry_filter = function(entry, ctx)
              if string.len(entry:get_word()) <= 4 then
                return false
              end
              return not string.match(entry:get_word(), " ")
            end
          },
        }),
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
      }
    end,
  }
}
