-- {{@@ header() @@}}

return function()
  local map = require('utils').map
  local telescope = require('telescope')
  local actions = require('telescope.actions')

  require('telescope').setup({
    defaults = {
      prompt_prefix = '   ',
      selection_caret = ' ',
      entry_prefix = ' ',
      sorting_strategy = 'ascending',
      layout_strategy = 'horizontal',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.80,
        height = 0.85,
        preview_cutoff = 120,
      },
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<esc>'] = actions.close,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
      },
    },
    file_ignore_patterns = {
      'nodes_modules/.*',
      '.git/.*',
      'target/.*',
      '.yarn',
      'documentation/index.html',
    },
  })

  telescope.load_extension('fzf')

  map('n', '<C-p>', ':Telescope find_files<CR>')
  map('n', '/', ':Telescope live_grep<CR>')
  map('n', '<C-s>', ':Telescope lsp_document_symbols<CR>')
  map('n', '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>')
end
