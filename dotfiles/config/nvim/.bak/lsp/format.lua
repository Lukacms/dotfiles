local M = {}

function M.on_attach(client, buf)
  local is_path_excluded = M.is_path_excluded(buf, client)

  if
    is_path_excluded
    or (client.config and client.config.capabilities and client.config.capabilities.documentFormattingProvider == false)
  then
    return
  end

  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('LspFormat' .. buf, {}),
      buffer = buf,
      callback = function()
        if vim.g.disable_autoformat or vim.b[buf].disable_autoformat then
          return
        end

        M.format()
      end,
    })
  end
end

---@param opts? {async?:boolean, force?: boolean}
function M.format(opts)
  local defaults = { async = false, force = false, noremap = true }
  opts = vim.tbl_deep_extend('force', defaults, opts or {})

  local buf = vim.api.nvim_get_current_buf()

  vim.lsp.buf.format({
    async = opts.async,
    bufnr = buf,
    filter = function(client)
      return M.is_client_excluded(client)
    end,
  })
end

function M.is_client_excluded(client)
  local excluded_clients = { --[[ 'ts_ls' ]] }

  for _, excluded_client in ipairs(excluded_clients) do
    if excluded_client == client.name then
      return false
    end
  end
  return true
end

function M.is_path_excluded(buf, client)
  local buf_path = vim.api.nvim_buf_get_name(buf)
  local excluded_paths = {}
  local success, custom = pcall(require, 'custom')
  if success then
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

  return is_excluded
end

return M
