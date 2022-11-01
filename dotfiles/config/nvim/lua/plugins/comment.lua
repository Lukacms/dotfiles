-- {{@@ header() @@}}

return function()
  require('Comment').setup({
    ignore = '^$',
    toggler = {
      line = '<Space>/',
    },
  })
end
