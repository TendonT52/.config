return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
    },
    config = function(_, opts)
      require("mason-lspconfig").setup()
    end,
  }
}