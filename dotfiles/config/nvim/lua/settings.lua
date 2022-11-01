-- auto source and compile when saving changes to nvim config
vim.cmd('augroup nvimconfig')
vim.cmd('  autocmd!')
vim.cmd('  autocmd BufWritePost ~/.config/nvim/** :so $MYVIMRC')
vim.cmd('  autocmd BufWritePost ~/.config/nvim/** :PackerCompile')
vim.cmd('augroup END')

