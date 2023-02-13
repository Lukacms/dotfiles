local M = {}

M.is_path_excluded = function(bufnr, client)
	local buf_path = vim.api.nvim_buf_get_name(bufnr)
	local excluded_paths = {}
	local success, custom = pcall(require, "custom")
	if success then
		excluded_paths = custom.excluded_paths[client.name]
	end
	local is_excluded = false

	if excluded_paths ~= nil then
		for i = 1, #excluded_paths do
			if buf_path:find("^" .. excluded_paths[i]) ~= nil then
				is_excluded = true
				break
			end
		end
	end

	return is_excluded
end

return M
