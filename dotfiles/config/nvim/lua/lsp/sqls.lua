local M = {}

M.setup = function(on_attach, capabilities)
	require 'lspconfig'.sqls.setup {
		on_attach = function(client, bufnr)
			require('sqls').on_attach(client, bufnr) -- require sqls.nvim
		end,
		settings = {
			sqls = {
				connections = {
					{
						driver = 'mysql',
						dataSourceName = 'root:root@tcp(127.0.0.1:13306)/world',
					},
					{
						driver = 'postgresql',
						dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
					},
				},
			},
		},
	}
end

return M
