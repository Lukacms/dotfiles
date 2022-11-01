-- {{@@ header() @@}}

return function()
  require('tabline').setup({
    options = {
      max_bufferline_percent = 1,
      show_tabline_buffers = 0,
    },
  })
end
