-- {{@@ header() @@}}

local map = require('utils').map

-- set leader key
vim.g.mapleader = ','

-- Remap ; to :
-- map('n', ';', ':')

-- jk to return to normal mode
map({ 'i', 'v' }, 'jk', '<Esc>')

-- tab navigation
map('n', 'H', ':tabprevious<CR>')
map('n', 'L', ':tabnext<CR>')
map('n', 'T', ':tabnew<CR>')
map('n', 'C', ':tabclose<CR>')

-- Map Alt+Arrows to move lines
map('n', '<C-k>', ':m-2 <CR>==')
map('n', '<C-j>', ':m+ <CR>==')
map('v', '<C-k>', ':m \'<-2<CR>gv=gv')
map('v', '<C-j>', ':m \'>+1<CR>gv=gv')

-- Resize buffer size
map('n', '<Up>', '<C-w>2-')
map('n', '<Down>', '<C-w>2+')
map('n', '<Left>', '<C-w>2<')
map('n', '<Right>', '<C-w>2>')

-- Fold
map('n', '<Space>', 'za')

map('n', 'n', ':cnext<CR>')
map('n', 'N', ':cprev<CR>')
