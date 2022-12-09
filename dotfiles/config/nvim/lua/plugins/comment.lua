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
	})
end
