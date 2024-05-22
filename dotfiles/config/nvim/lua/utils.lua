local default_options = {
	noremap = true,
	silent = true,
}

return {
	map = function(mode, keys, action, opts)
		local options = default_options
		if opts then
			options = vim.tbl_extend("force", options, opts)
		end

		vim.keymap.set(mode, keys, action, options)
	end,
	buf_map = function(buffer, mode, keys, action, opts)
		local options = default_options

		options.buffer = buffer
		if opts then
			options = vim.tbl_extend("force", options, opts)
		end

		vim.keymap.set(mode, keys, action, options)
	end,

	buf_command = function(bufnr, name, fn, opts)
		vim.api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
	end,

	highlight = function(group, color)
		local command = "hi " .. group .. " "
		if color.style then
			command = command .. " gui=" .. color.style
		end
		if color.fg then
			command = command .. " guifg=" .. color.fg
		end
		if color.bg then
			command = command .. " guibg=" .. color.bg
		end
		if color.sp then
			command = command .. " guisp=" .. color.sp
		end

		vim.cmd(command)
	end,

	fold_handler = function(virt_text, fold_start_line, fold_end_line, width, truncate)
		local new_virt_text = {}
		local suffix = ("  %d "):format(fold_end_line - fold_start_line)
		local suf_width = vim.fn.strdisplaywidth(suffix)
		local target_width = width - suf_width
		local cur_width = 0

		local fold_hl_group = nil

		for _, chunk in ipairs(virt_text) do
			local chunk_text = chunk[1]
			local chunk_width = vim.fn.strdisplaywidth(chunk_text)

			fold_hl_group = chunk[2] -- Not 100% guarantee to have the good hl group if
			-- there is something after the fold character but most likely to.

			if target_width > cur_width + chunk_width then
				table.insert(new_virt_text, chunk)
			else
				chunk_text = truncate(chunk_text, target_width - cur_width)
				local hl_group = chunk[2]

				table.insert(new_virt_text, { chunk_text, hl_group })
				chunk_width = vim.fn.strdisplaywidth(chunk_text)
				-- str width returned from truncate() may less than 2nd argument, need padding
				if cur_width + chunk_width < target_width then
					suffix = suffix .. (" "):rep(target_width - cur_width - chunk_width)
				end
				break
			end
			cur_width = cur_width + chunk_width
		end
		table.insert(new_virt_text, { suffix, "MoreMsg" })
		table.insert(new_virt_text, { vim.fn.trim(vim.fn.getline(fold_end_line)), fold_hl_group })

		return new_virt_text
	end,
}
