return {
  {
    "mason-org/mason.nvim",
    -- version = "^1.0.0",
    opts = {
      ensure_installed = {
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
        "golangci-lint",
        "golangci-lint-langserver",
        "gomodifytags",
        "gopls",
        "hclfmt",
        "java-language-server",
        "json-lsp",
        "lua-language-server",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "neocmakelsp",
        "php-cs-fixer",
        "phpactor",
        "phpcs",
        "prettier",
        "pyright",
        "ruff",
        "shellcheck",
        "shfmt",
        "sqlls",
        "sqlfluff",
        "stylua",
        "svelte-language-server",
        "tailwindcss-language-server",
        "yaml-language-server",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   dependencies = "mason.nvim",
  --   cmd = { "DapInstall", "DapUninstall" },
  --   opts = {
  --     ensure_installed = nil,

  --     -- see mason-nvim-dap README for more information
  --     handlers = nil,

  --     -- You'll need to check that you have the required things installed
  --     -- online, please don't ask me how to install them :)
  --     automatic_installation = true,
  --   },
  --   -- mason-nvim-dap is loaded when nvim-dap loads
  --   config = function() end,
  -- },
}
