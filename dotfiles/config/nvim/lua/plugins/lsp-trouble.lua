return function()
  local map = require('utils').map

  require('trouble').setup({
    use_diagnostic_signs = true,
  })

  map('n', '<C-d>', ':Trouble document_diagnostics<CR>')
end
