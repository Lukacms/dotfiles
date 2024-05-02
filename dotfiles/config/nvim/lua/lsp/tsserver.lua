local u = require("utils")

local M = {}

M.setup = function(on_attach, capabilities)
	require("typescript").setup({
		server = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				u.buf_map(bufnr, "n", "<leader>h", ":TypescriptOrganizeImports<CR>")
			end,
		},
	})
end

return M
