local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").elixirls.setup({
		capabilities = capabilities,
		cmd = { "~/Software/elixirls/language_server.sh" },
		on_attach = on_attach,
	})
end

return M
