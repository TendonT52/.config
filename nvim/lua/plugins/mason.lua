return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  }
}
