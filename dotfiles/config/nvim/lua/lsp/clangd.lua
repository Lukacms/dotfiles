local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").clangd.setup({
		capabilities = capabilities,
		cmd = { "clangd", "--background-index", "-clang-tidy" },
		on_attach = on_attach,
		filetype = { "c", "cpp", "objc", "objcpp" },
	})
end

return M
