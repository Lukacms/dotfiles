-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Stop pressing shift
map({ "n", "v" }, ";", ":")

-- Disable search highlight
map("n", "//", ":nohlsearch<CR>")

-- General
map("n", "<c-s-i>", "<cmd>LazyFormat<cr>")
map("n", "<leader>lg", "<cmd>lua Snacks.lazygit()<cr>")
map("n", "<leader>z", "<cmd>TodoTelescope<cr>")

-- Tabs
map("n", "T", ":tabnew<cr>")
vim.keymap.del("n", "<s-h>", { desc = "prev buffer" })
vim.keymap.del("n", "<s-l>", { desc = "next buffer" })
vim.keymap.del("n", "<C-l>", { desc = "shortcut for right window" })
vim.keymap.del("n", "<C-h>", { desc = "shortcut for left window" })
vim.keymap.del("n", "<C-f>", { desc = "scroll" })
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>")

-- Resize buffer size
-- Resize buffer size
map("n", "<Up>", "<C-w>2-")
map("n", "<Down>", "<C-w>2+")
map("n", "<Left>", "<C-w>2<")
map("n", "<Right>", "<C-w>2>")

-- In visual block mode, enter insert mode with i instead of I
map("x", "i", "I")

-- Unbind annoying Ex mode
map("n", "Q", "<Nop>")

-- Enter/leave terminal mode
map("n", "<leader>T", ":10sp<CR>:term<CR>A")
map("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Trouble
map("n", "<C-d>", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")

-- Re-select selection after moving it left/right with </>
map("v", "<", "<gv")
map("v", ">", ">gv")

-- tab navigation
-- map("n", "<Tab>", ":tabprevious<CR>")
-- map("n", "<S-Tab>", ":tabnext<CR>")
map("n", "T", ":tabnew<CR>")
map("n", "C", ":tabclose<CR>")

-- Preserve clipboard when pasting over selection
map("v", "p", "pgvy")

-- Delete LazyVim bindings
vim.keymap.del("n", "<leader>uS", { desc = "Snacks toggle smooth scroll" })

require("config.qf").setup({ default_bindings = true })

-- map code-action to more intuitive keymap
map({ "n", "v" }, "<C-c>", function()
  vim.lsp.buf.code_action()
end)

-- rename item w/ lsp
map({ "n", "v" }, "<leader>r", vim.lsp.buf.rename)

-- tests
map("n", "<C-t>o", "<cmd>Neotest output<cr>")
map("n", "<c-t><c-t>", ':lua require("neotest").summary.toggle()<CR>')
map("n", "<c-t>r", ':lua require("neotest").run.run()<CR>')
map("n", "<c-t>R", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
