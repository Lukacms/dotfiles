local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			json = {
				validate = { enable = true },
				schemas = require("schemastore").json.schemas(),
			},
		},
	})
end

return M
