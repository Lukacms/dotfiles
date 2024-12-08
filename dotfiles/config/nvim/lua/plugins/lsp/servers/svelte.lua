local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').svelte.setup({})
end

return M
