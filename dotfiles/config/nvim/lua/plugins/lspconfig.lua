return {
  -- add any tools you want to have installed below
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        nomad_lsp = {
          filetypes = { "hcl.nomad", "nomad", "*.nomad" },
        },
        basedpyright = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
          },
        },
      },
    },
  },
}
