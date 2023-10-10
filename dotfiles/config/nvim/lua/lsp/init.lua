local lsp_utils = require("lsp.utils")
local u = require("utils")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = {
    prefix = "",
  },
})

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr, async, range)
  vim.lsp.buf.format({
    async = async,
    bufnr = bufnr,
    filter = function(client)
      local excluded_clients = { "html", "tsserver" }

      for _, excluded_client in ipairs(excluded_clients) do
        if excluded_client == client.name then
          return false
        end
      end
      return true
    end,
    range = range,
  })
end

local on_attach = function(client, bufnr)
  u.buf_map(bufnr, "n", "gd", vim.lsp.buf.definition)
  u.buf_map(bufnr, "n", "gi", vim.lsp.buf.implementation)
  u.buf_map(bufnr, "n", "K", vim.lsp.buf.hover)
  u.buf_map(bufnr, "n", "<C-l>", vim.lsp.buf.signature_help)
  u.buf_map(bufnr, "n", "gt", vim.lsp.buf.type_definition)
  u.buf_map(bufnr, "n", "gr", vim.lsp.buf.references)
  u.buf_map(bufnr, "n", "<C-c>", ":CodeActionMenu<CR>")
  u.buf_map(bufnr, "n", "<leader>d", vim.diagnostic.open_float)
  u.buf_map(bufnr, "n", "<leader>r", vim.lsp.buf.rename)
  u.buf_map(bufnr, "n", "<C-d>", ":Trouble document_diagnostics<CR>")

  if client.supports_method("textDocument/formatting") then
    u.buf_command(bufnr, "LspFormatting", function()
      lsp_formatting(bufnr, false)
    end)
    u.buf_map(bufnr, "n", "<leader>f", function()
      lsp_formatting(bufnr, true)
    end)
    if lsp_utils.is_path_excluded(bufnr, client) == false then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        command = "LspFormatting",
      })
    end
  end

  if client.supports_method("textDocument/rangeFormatting") then
    u.buf_map(bufnr, "v", "<leader>f", function()
      local start = vim.api.nvim_buf_get_mark(0, "<")
      local _end = vim.api.nvim_buf_get_mark(0, ">")
      local range = { start = start, ["end"] = _end }

      lsp_formatting(bufnr, true, range)
    end)
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers_names = {
  "bashls",
  "clangd",
  "cmake",
  "csharp_ls",
  "cssmodules_ls",
  "dockerls",
  "elixirls",
  "html",
  "hls",
  "java_language_server",
  "jsonls",
  "lua_ls",
  "null-ls",
  "pyright",
  "rust-analyzer",
  -- "sumneko_lua",
  "texlab",
  "tsserver",
  "yamlls",
}

for _, server_name in ipairs(servers_names) do
  local success, server = pcall(require, "lsp." .. server_name)

  if success then
    server.setup(on_attach, capabilities)
  else
    -- Load default lsp config
    require("lspconfig")[server_name].setup({ on_attach, capabilities })
  end
end
