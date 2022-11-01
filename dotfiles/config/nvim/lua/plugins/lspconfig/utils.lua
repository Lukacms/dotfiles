-- {{@@ header() @@}}

local M = {}

M.buf_set_keymap = function(bufnr, ...)
  require('utils').buf_map(bufnr, ...)
end

M.set_ls_formatting_keymaps = function(client, bufnr)
  local buf_path = vim.api.nvim_buf_get_name(bufnr)
  local excluded_paths = {}
  local res, custom = pcall(require, 'custom')
  if res then
    excluded_paths = custom.excluded_paths[client.name]
  end
  local is_excluded = false

  if excluded_paths ~= nil then
    for i = 1, #excluded_paths do
      if buf_path:find('^' .. excluded_paths[i]) ~= nil then
        is_excluded = true
        break
      end
    end
  end

  if client.server_capabilities.documentFormattingProvider then
    M.buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
    if is_excluded == false then
      vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })')
    end
  end
  if client.server_capabilities.documentRangeFormattingProvider then
    M.buf_set_keymap(bufnr, 'v', '<leader>f', '<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>')
  end
end

M.set_ls_keymaps = function(client, bufnr, formatting)
  M.buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  M.buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  M.buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  M.buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  M.buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  M.buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  M.buf_set_keymap(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  M.buf_set_keymap(bufnr, 'n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  M.buf_set_keymap(bufnr, 'n', '<C-c>', '<cmd>CodeActionMenu<CR>')
  M.buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
  M.buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

  local excluded_clients = { html = true }

  if formatting and excluded_clients[client.name] ~= true then
    M.set_ls_formatting_keymaps(client, bufnr)
  else
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end

return M
