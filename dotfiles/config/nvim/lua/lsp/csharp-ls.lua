local M = {}

M.setup = function(on_attach, capabilities)
  require 'lspconfig'.csharp_ls.setup {}
end

return M
