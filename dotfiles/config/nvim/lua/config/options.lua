-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.filetype.add({ extensions = { nomad = "hcl" } })
local opt = vim.opt

vim.g.mapleader = ","

-- Lazy -----------------------------------------------------------------------

vim.g.root_spec = {
  {
    ".git",
    "lua",
    "go.mod",
    "setup.py",
    "package.json",
    "Makefile",
    "justfile",
    "Dockerfile",
    "init.lua",
    "svelte.config.js",
  },
  "lsp",
  "cwd",
}

vim.g.snacks_animate = false

-- UI -------------------------------------------------------------------------
opt.list = false
opt.scrolloff = 999
opt.sidescrolloff = 8
opt.colorcolumn = "80"
opt.mouse = "c" -- disable mouse
opt.wrap = true -- Display long lines as multiple lines
opt.linebreak = true

-- Edition --------------------------------------------------------------------

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.autoindent = true
opt.errorbells = false
opt.fixeol = false
opt.eol = false
opt.binary = true
vim.g.editorconfig = true

-- Search ---------------------------------------------------------------------

opt.inccommand = "split"
opt.wildignorecase = true
opt.wildignore:append({ "*.o", "*.gcno", "*.gcda", "node_modules", ".git" })
opt.autochdir = false

-- Backup ---------------------------------------------------------------------

opt.backup = true
opt.undofile = true
opt.swapfile = false
opt.undodir = vim.fn.expand("~/.nvim/tmp/undo/")
opt.backupdir = vim.fn.expand("~/.nvim/tmp/backup/")
opt.directory = vim.fn.expand("~/.nvim/tmp/swap/")

--- LSP -----------------------------------------------------------------------
vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_python_lsp = "pyright"
vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true,

  -- Alternatively, customize specific options
  -- virtual_lines = {
  --   -- Only show virtual line diagnostics for the current cursor line
  --   current_line = true,
  -- },
})
