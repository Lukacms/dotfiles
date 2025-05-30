local map = require("utils").map

-- set leader key
vim.g.mapleader = ","

-- Remap ; to :
map("n", ";", ":")

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

-- Fold
map("n", "<Space>", "za")

--[[ map('n', 'n', ':cnext<CR>')
map('n', 'N', ':cprev<CR>') ]]

-- Neotest
map("n", "<c-t><c-t>", ':lua require("neotest").summary.toggle()<CR>')
map("n", "<c-t>r", ':lua require("neotest").run.run()<CR>')
map("n", "<c-t>R", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')

-- https://github.com/mhinz/vim-galore#dont-lose-selection-when-shifting-sidewards
map('v', '<', '<gv')
map('v', '>', '>gv')
