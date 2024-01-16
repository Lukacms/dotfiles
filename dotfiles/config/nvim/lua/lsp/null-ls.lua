local null_ls = require("null-ls")
local b = null_ls.builtins

-- https://github.com/jose-elias-alvarez/null-ls.nvim/pull/804
local buf_path_in_workflow_folder = function()
	local api = vim.api
	local path = api.nvim_buf_get_name(api.nvim_get_current_buf())
	return path:match("github/workflows/") ~= nil
end

local sources = {
	b.diagnostics.actionlint.with({
		runtime_condition = buf_path_in_workflow_folder,
	}),

	function()
		local nl_utils = require("null-ls.utils").make_conditional_utils()
		return nl_utils.root_has_file({ ".prettierrc.json", ".prettierrc" })
				and b.formatting.prettierd.with({ filetypes = { "html", "javascript", "typescript", "svelte" } })
			or b.formatting.eslint_d
	end,

	b.formatting.black,
	b.formatting.stylua,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
}

local M = {}

M.setup = function(on_attach)
	null_ls.setup({
		debug = false,
		sources = sources,
		on_attach = on_attach,
	})
end

return M
