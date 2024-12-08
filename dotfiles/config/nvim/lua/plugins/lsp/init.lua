return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        prefix = "",
        severity_sort = true,
        source = "if_many",
      },
      spacing = 1,
    },
    servers = {
      "bashls",
      "basedpyright",
      "clangd",
      "cmake",
      "cssmodules_ls",
      "dockerls",
      "elixirls",
      -- "eslint",
      "gopls",
      "golangci_lint_ls",
      "html",
      "hls",
      "jsonls",
      "lua_ls",
      -- "null-ls",
      -- "pyright",
      -- "rust-analyzer", -- NOTE don't get it, the rust plugin is enough
      "svelte",
      "sqls",
      "tailwindcss",
      "texlab",
      "ts_ls",
      "yamlls",
    },
  },
  config = function(_, opts)
    -- diagnostics
    local diag_icons = require("config").icons.diagnostics
    for name, icon in pairs(diag_icons) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name })
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, opts.diagnostics)

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local on_attach = function(client, buf)
      require("lsp.format").on_attach(client, buf)
      require("lsp.keymaps").on_attach(client, buf)

      if client.supports_method("textDocument/documentSymbol") then
        require("nvim-navic").attach(client, buf)
      end
    end

    for _, server_name in ipairs(opts.servers) do
      local success, server = pcall(require, "lsp.servers." .. server_name)

      if success then
        server.setup(on_attach, capabilities)
      else
        -- Load default lsp config
        require("lspconfig")[server_name].setup({ on_attach, capabilities })
      end
    end
  end,
  dependencies = {
    {
      "aznhe21/actions-preview.nvim",
      config = function()
        require("actions-preview").setup({
          highlight_command = {
            require("actions-preview.highlight").delta(),
            require("actions-preview.highlight").diff_so_fancy(),
            require("actions-preview.highlight").diff_highlight(),
          },
        })
      end,
    },
    {
      "nvimtools/none-ls.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvimtools/none-ls-extras.nvim",
      },
      event = { "BufReadPre", "BufNewFile" },
      lazy = true,
      config = function(_, opts)
        local null_ls = require("null-ls")
        local b = null_ls.builtins
        local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local sources = {
          b.diagnostics.actionlint,
          require("none-ls.diagnostics.eslint_d"),
          require("none-ls.formatting.eslint_d"),

          function()
            local nl_utils = require("null-ls.utils").make_conditional_utils()
            if nl_utils.root_has_file({ ".prettierrc.json", ".prettierrc" }) then
              return b.formatting.prettierd.with({
                filetypes = { "html", "javascript", "typescript", "svelte" },
              })
            else
              return require("none-ls.formatting.eslint_d")
            end
          end,

          b.formatting.black,
          b.formatting.stylua,
          b.formatting.clang_format,
          b.formatting.cmake_format,
          -- go
          b.formatting.gofumpt,
          b.formatting.goimports,
          --
          b.formatting.htmlbeautifier,
          b.formatting.just,
        }

        require("null-ls").setup({
          debug = false,
          sources = sources,
        })

        vim.keymap.set("n", "<leader>v", vim.lsp.buf.format, {})
      end,
    },
    "simrat39/rust-tools.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
}
