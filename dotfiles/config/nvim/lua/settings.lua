-- auto source and compile when saving changes to nvim config
vim.cmd("augroup nvimconfig")
vim.cmd("  autocmd!")
vim.cmd("  autocmd BufWritePost ~/.config/nvim/** :so $MYVIMRC")
vim.cmd("augroup END")

vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Open neo-tree on enter",
	group = "neotree_autoopen",
	callback = function()
		if not vim.g.neotree_opened then
			vim.cmd("Neotree show")
			vim.g.neotree_opened = true
		end
	end,
})
