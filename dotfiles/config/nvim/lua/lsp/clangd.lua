local M = {}

M.setup = function(on_attach, capabilities)
    require("lspconfig").clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--background-index", "-clang-tidy", "-j=2" },
        on_attach = on_attach,
        filetype = { "c", "cpp", "objc", "objcpp" },
    })
end

return M
