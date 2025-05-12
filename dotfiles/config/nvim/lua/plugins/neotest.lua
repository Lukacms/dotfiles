return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
    },
    opts = function()
      return {
        adapters = {
          require("neotest-go")({
            args = { "-timeout=30s" },
          }),
          require("neotest-python"),
        },
      }
    end,
  },
}
