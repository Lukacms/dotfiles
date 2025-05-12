return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "~/.config/nvim/snippets" },
      })
    end,
    keys = {
      {
        "<C-l>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "i",
      },
      {
        "<C-h>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = "i",
      },
    },
  },
}
