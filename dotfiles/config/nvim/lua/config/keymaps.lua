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

-- Tabs
map("n", "T", ":tabnew<cr>")
vim.keymap.del("n", "<s-h>", { desc = "prev buffer" })
vim.keymap.del("n", "<s-l>", { desc = "next buffer" })
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

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

-- Preserve clipboard when pasting over selection
map("v", "p", "pgvy")

-- Delete LazyVim bindings
vim.keymap.del("n", "<leader>uS", { desc = "Snacks toggle smooth scroll" })

require("config.qf").setup({ default_bindings = true })
