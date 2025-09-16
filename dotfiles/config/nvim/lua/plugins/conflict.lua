return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    opts = {
      default_mappings = {
        ours = "o",
        theirs = "t",
        none = "0",
        both = "b",
        next = "n",
        prev = "p",
      },
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "DiffAdd",
        current = "DiffText",
      },
    },
  },
}
