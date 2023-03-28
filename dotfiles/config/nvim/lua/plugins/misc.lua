local utils = require("utils")

return {
	{
		"andweeb/presence.nvim",
		config = function(plugin, opts)
			require("presence").setup()
		end,
	},
}
