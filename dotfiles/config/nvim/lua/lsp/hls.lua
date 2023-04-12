local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").hls.setup({
		capabilities = capabilities,
		cmd = { "haskell-language-server-wrapper", "--lsp" },
		on_attach = on_attach,
		filetypes = { "haskell", "lhaskell" },
		settings = {
			haskell = {
				-- formattingProvider = "stylish-haskell",
				--[[ formattingProvider = "",
				cabalFormattingProvider = "cabalfmt", ]]
			},
		},
	})
end

return M
