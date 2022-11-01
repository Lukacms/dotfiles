-- {{@@ header() @@}}

return function()
  local map = require('utils').map

  require('neo-tree').setup({
    window = {
      mappings = {
        ['o'] = 'open_with_window_picker',
      },
    },

    default_component_configs = {
      indent = {
        with_markers = false,
      },
      name = {
        use_git_status_colors = false,
      },
      git_status = {
        symbols = {
          deleted = '',

          untracked = '*',
        },
      },
    },
  })

  map('n', '<C-b>', ':NeoTreeRevealToggle<CR>')
end
