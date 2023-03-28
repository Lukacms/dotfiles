return {
	{
		"Mofiqul/vscode.nvim",
		priority = 1000,
		opts = {
			transparent = true,
			italic_comments = true,
			color_overrides = {
				vscLineNumber = "#D7BA7D",
			},
			group_overrides = {
				-- this supports the same val table as vim.api.nvim_set_hl
				-- use colors from this colorscheme by requiring vscode.colors!
				Cursor = {
					fg = "#646695",
					bg = "#B5CEA8",
					bold = true,
				},
			},
		},
		config = function(plugin, opts)
			require("vscode").setup(opts)
			require("vscode").load()
		end,
	},
}
