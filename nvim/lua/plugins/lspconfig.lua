return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    keys = {
    },
    opts = {
    },
    config = function(_, opts)
      require'lspconfig'.gopls.setup{}
    end,
  },

}
