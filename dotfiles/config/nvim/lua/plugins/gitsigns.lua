-- {{@@ header() @@}}

return function()
  local highlight = require('utils').highlight
  local colors = require('highlights').colors

  highlight('GitSignsAddNr', { bg = colors.clover, fg = 'NONE' })
  highlight('GitSignsChangeNr', { bg = colors.raw_umber, fg = 'NONE' })
  highlight('GitSignsDeleteNr', { bg = colors.bordeaux, fg = 'NONE' })

  require('gitsigns').setup({
    signs = {
      add = { numhl = 'GitSignsAddNr' },
      change = { numhl = 'GitSignsChangeNr' },
      delete = { numhl = 'GitSignsDeleteNr' },
      topdelete = { numhl = 'GitSignsDeleteNr' },
      changedelete = { numhl = 'GitSignsChangeNr' },
    },
    signcolumn = false,
    numhl = true,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local buf_map = require('utils').buf_map

      buf_map(bufnr, 'n', '<leader>g', function()
        gs.blame_line({ full = true })
      end)
    end,
  })
end
