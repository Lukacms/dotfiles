return {
  {
    "lukaszmoskwa/nomad.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
      require("nomad").setup({
        -- your configuration here
      })
    end,
  },
}
