-- {{@@ header() @@}}

return function()
  require('todo-comments').setup({
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX = {
        icon = ' ',
        color = 'error',
        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
      },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = 'warning' },
      WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
      before = '', -- "fg" or "bg" or empty
      keyword = 'wide', -- "fg", "bg", "wide" or empty.
      after = 'fg',
      pattern = [[.*<(KEYWORDS)\s*]],
      comments_only = true,
      max_line_len = 400,
    },
    colors = {
      error = { 'LspDiagnosticsDefaultError', 'ErrorMsg', '#DC2626' },
      warning = { 'LspDiagnosticsDefaultWarning', 'WarningMsg', '#FBBF24' },
      info = { 'LspDiagnosticsDefaultInformation', '#2563EB' },
      hint = { 'LspDiagnosticsDefaultHint', '#10B981' },
      default = { 'Identifier', '#7C3AED' },
    },
    search = {
      command = 'rg',
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
      },
      pattern = [[\b(KEYWORDS)]], -- ripgrep regex
    },
  })
end
