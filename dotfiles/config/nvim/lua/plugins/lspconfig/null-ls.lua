-- {{@@ header() @@}}
local null_ls = require('null-ls')
local utils = require('plugins.lspconfig.utils')

-- https://github.com/jose-elias-alvarez/null-ls.nvim/pull/804
local buf_path_in_workflow_folder = function()
  local api = vim.api
  local path = api.nvim_buf_get_name(api.nvim_get_current_buf())
  return path:match('github/workflows/') ~= nil
end

require('null-ls').setup({
  debug = false,
  sources = {

    null_ls.builtins.diagnostics.actionlint.with({
      runtime_condition = buf_path_in_workflow_folder,
    }),

    function()
      local nl_utils = require('null-ls.utils').make_conditional_utils()
      return nl_utils.root_has_file('.prettierrc.json')
          and null_ls.builtins.formatting.prettierd.with({ filetypes = { 'html', 'javascript', 'typescript' } })
        or null_ls.builtins.formatting.eslint_d
    end,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    utils.set_ls_formatting_keymaps(client, bufnr)
  end,
})
