local M = {}

local paswd = os.getenv("PGIS_PASWD") or ""
local host = os.getenv("PGIS_HOST") or ""

M.setup = function(on_attach, capabilities)
    require("lspconfig").sqls.setup({
        on_attach = function(client, bufnr)
            require("sqls").on_attach(client, bufnr) -- require sqls.nvim
        end,
        settings = {
            sqls = {
                connections = {
                    {
                        driver = "postgresql",
                        dataSourceName = string.format(
                            "host=%s port=13432 user=postgres password=%s dbname=gis sslmode=disable",
                            host,
                            paswd
                        ),
                    },
                },
            },
        },
    })
end

return M
