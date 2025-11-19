return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "basedpyright",
        "black",
        "clangd",
        "cmakelang",
        "cmakelint",
        "codelldb",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "elixir-ls",
        "gofumpt",
        "goimports",
        -- "golangci-lint" -- installed on the host machine at a specific version
        "golangci-lint-langserver",
        "gomodifytags",
        "gopls",
        "impl",
        "hclfmt",
        "json-lsp",
        "lua-language-server",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "neocmakelsp",
        "php-cs-fixer",
        "phpactor",
        "phpcs",
        -- "pyright", -- installed on the host machine at a specific version
        "ruff",
        "shellcheck",
        "shfmt",
        "sqlfluff",
        "stylua",
        "svelte-language-server",
        "tailwindcss-language-server",
        "yaml-language-server",
      },
      automatic_installation = false,
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
  },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "python",
  --       "delve",
  --     },
  --     automatic_installation = false,
  --   },
  -- },
}
