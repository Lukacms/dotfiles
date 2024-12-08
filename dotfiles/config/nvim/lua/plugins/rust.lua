return {
  {
    "simrat39/rust-tools.nvim",
    opts = function()
      require("rust-tools").setup({ tools = {} })
    end,
  },
}
