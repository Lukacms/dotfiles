local M = {}

M.setup = function (on_attach, capabilities)
    require('lspconfig').ts_ls.setup({
    })
end

return M
