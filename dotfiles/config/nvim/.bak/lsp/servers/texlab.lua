local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").texlab.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			texlab = {
				build = {
					executable = "tectonic",
					args = {
						"%f",
						"--synctex",
						"--keep-logs",
						"--keep-intermediates",
					},
				},
				formatterLineLength = 80,
				latexFormatter = "latexindent",
				latexindent = {
					modifyLineBreaks = true,
				},
			},
		},
	})
end

return M
