return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      view = "cmdline",
      format = {
        search_down = {
          view = "cmdline",
        },
        search_up = {
          view = "cmdline",
        },
      },
    },
    lsp = { progress = { enabled = true } },
  },
}
