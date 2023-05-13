return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<CR>" },
      { "ga", "<cmd>Lspsaga code_action<CR>" },
      { "gr", "<cmd>Lspsaga rename ++project<CR>" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>" },
      { "gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto T[y]pe Definition" },
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>" },
      {"<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>"},
      {"<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>"},
      {"<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>"},
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>"},
      {"K", "<cmd>Lspsaga hover_doc<CR>"},
      {"<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>"},
      {"<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>"},
    },
    init = function ()
      local theme = require("config.theme")
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      {"nvim-treesitter/nvim-treesitter"}
    },
    opts = function ()
     return {

      ui = {
        -- This option only works in Neovim 0.9
        title = false,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "rounded",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "💡",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        kind = {},
      },
     } 
    end,
    config = function(_, opts)
        require("lspsaga").setup(opts)
    end,
  }
}