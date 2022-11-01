-- {{@@ header() @@}}

return function()
  local map = require('utils').map

  local opts = {}

  map('n', '<Leader>s', ':SymbolsOutlineOpen<CR>')

  require('symbols-outline').setup(opts)
end
