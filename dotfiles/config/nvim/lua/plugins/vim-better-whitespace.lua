-- {{@@ header() @@}}

return function()
  local map = require('utils').map

  map('n', '<leader><Space>', ':StripWhitespace<CR>')
  map('v', '<leader><Space>', ':StripWhitespace<CR>')
end
