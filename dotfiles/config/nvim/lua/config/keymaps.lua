-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Stop pressing shift
map({ "n", "v" }, ";", ":")

-- jk to return to normal mode
map({ "i", "v" }, "jk", "<Esc>")

-- tab navigation
map("n", "<leader>H", ":tabprevious<CR>")
map("n", "<leader>L", ":tabnext<CR>")
map("n", "T", ":tabnew<CR>")
map("n", "C", ":tabclose<CR>")

-- Map Alt+Arrows to move lines
map("n", "<C-k>", ":m-2 <CR>==")
map("n", "<C-j>", ":m+ <CR>==")
map("v", "<C-k>", ":m '<-2<CR>gv=gv")
map("v", "<C-j>", ":m '>+1<CR>gv=gv")

-- Resize buffer size
map("n", "<Up>", "<C-w>2-")
map("n", "<Down>", "<C-w>2+")
map("n", "<Left>", "<C-w>2<")
map("n", "<Right>", "<C-w>2>")

-- Tabs
map("n", "T", ":tabnew<cr>")
vim.keymap.del("n", "<s-h>", { desc = "prev buffer" })
vim.keymap.del("n", "<s-l>", { desc = "next buffer" })
vim.keymap.del("n", "<C-l>", { desc = "shortcut for right window" })
vim.keymap.del("n", "<C-h>", { desc = "shortcut for left window" })
vim.keymap.del("n", "<C-f>", { desc = "scroll" })
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

-- Fold
map("n", "<Space>", "za")

--[[ map('n', 'n', ':cnext<CR>')
map('n', 'N', ':cprev<CR>') ]]

-- In visual block mode, enter insert mode with i instead of I
map("x", "i", "I")

-- Neotest
map("n", "<c-t><c-t>", ':lua require("neotest").summary.toggle()<CR>')
map("n", "<c-t>r", ':lua require("neotest").run.run()<CR>')
map("n", "<c-t>R", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')

-- Re-select selection after moving it left/right with </>
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Preserve clipboard when pasting over selection
map("v", "p", "pgvy")

-- Delete LazyVim bindings
vim.keymap.del("n", "<leader>uS", { desc = "Snacks toggle smooth scroll" })

-- require("config.qf").setup({ default_bindings = true })

-- rename item w/ lsp
map({ "n", "v" }, "<leader>r", vim.lsp.buf.rename)
map({ "n", "v" }, "<C-D>", "<cmd>Trouble diagnostics toggle<cr>")
