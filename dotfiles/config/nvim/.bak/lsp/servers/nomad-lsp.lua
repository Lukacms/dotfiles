local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').nomad_lsp.setup {}
end

return M
