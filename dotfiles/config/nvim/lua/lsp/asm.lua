local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").asm.setup({
		capabilities = capabilities,
		cmd = { "asm-lsp" },
		on_attach = on_attach,
	})
end
return M

--[[ return {
	name = "asm-lsp",
	cmd = "asm-lsp",
	filetype = { "asm", "s", "S" },
} ]]
