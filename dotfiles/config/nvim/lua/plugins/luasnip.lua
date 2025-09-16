return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "~/.config/nvim/snippets/" },
      })
    end,
    opts = {
      keys = {
        {
          "<C-l>",
          function()
            require("luasnip").jump(1)
          end,
          mode = { "i", "s" },
        },
        {
          "<C-h>",
          function()
            require("luasnip").jump(-1)
          end,
          mode = { "i", "s" },
        },
      },
    },
  },
}
