-- {{@@ header() @@}}

return function()
	require("Comment").setup({
		ignore = "^$",
		mappings = {
			basic = true,
		},
		toggler = {
			line = "<Space>/",
			-- block = "<C>/",
		},
		opleader = {
			---Line-comment keymap
			line = "gc",
			---Block-comment keymap
			block = "gb",
		},
	})
end
