return {
  {
    "nvimdev/guard.nvim",
    -- lazy load by ft
    ft = { "lua", "c", "markdown" },
    -- Builtin configuration, optional
    dependencies = {
      "nvimdev/guard-collection",
    },
  },
}
