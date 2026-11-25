return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "fredrikaverpil/neotest-golang",
    },
    opts = function()
      return {
        adapters = {
          require("neotest-golang"),
          require("neotest-python"),
        },
      }
    end,
  },
}
