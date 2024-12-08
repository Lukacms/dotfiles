local null_ls = require('null-ls')
local b = null_ls.builtins

local sources = {
  b.diagnostics.actionlint,
  b.diagnostics.eslint_d,

  function()
    local nl_utils = require('null-ls.utils').make_conditional_utils()
    return nl_utils.root_has_file({ '.prettierrc.json', '.prettierrc' })
        and b.formatting.prettierd.with({ filetypes = { 'html', 'javascript', 'typescript', 'svelte' } })
        or b.formatting.eslint_d
  end,

  b.formatting.black,
  b.formatting.stylua,
  b.formatting.clang_format,
  b.formatting.cmake_format,
  -- go
  b.formatting.gofumpt,
  b.formatting.goimports,
  --
  b.formatting.htmlbeautifier,
  b.formatting.just,
}

local M = {}

M.setup = function(on_attach)
  null_ls.setup({
    debug = false,
    sources = sources,
    on_attach = on_attach,
  })
end

return M
