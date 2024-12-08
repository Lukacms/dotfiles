local M = {}

M._keys = nil

function M.get()
  local format = function()
    require('lsp.format').format({ async = true, force = true })
  end

  if not M._keys then
    -- mapping action
    M._keys = {
      { 'gd', vim.lsp.buf.definition },
      { 'gi', vim.lsp.buf.implementation },
      { 'K', vim.lsp.buf.hover },
      { '<C-k>', vim.lsp.buf.signature_help, has = 'signatureHelp' },
      { 'gt', vim.lsp.buf.type_definition },
      { '<C-c>', require('actions-preview').code_actions },
      { '<leader>d', vim.diagnostic.open_float },
      { '<leader>r', vim.lsp.buf.rename, has = 'rename' },
      { '<C-d>', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>' },
      { '<leader>f', format, has = 'documentFormatting' },
      { '<Leader>f', format, has = 'documentRangeFormatting', mode = 'v' },
    }
  end
  return M._keys
end

function M.on_attach(client, buf)
  for _, keymap in pairs(M.get()) do
    if not keymap.has or client.server_capabilities[keymap.has .. 'Provider'] then
      local opts = {
        noremap = true,
        silent = true,
        buffer = buf,
      }

      vim.keymap.set(keymap.mode or 'n', keymap[1], keymap[2], opts)
    end
  end
end

return M
