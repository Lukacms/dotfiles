return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>" },
      { "§", "<cmd>Telescope live_grep<CR>" },
      { "<C-s>", "<cmd>Telescope lsp_document_symbols<CR>" },
      { "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
    },
    init = function()
      local telescope = require("telescope")

      telescope.load_extension("fzf")
    end,
    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          entry_prefix = " ",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.80,
            height = 0.85,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              -- ["<esc>"] = actions.close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
        file_ignore_patterns = {
          "nodes_modules/.*",
          ".git/.*",
          "target/.*",
          ".yarn",
        },
      }
    end,
  },
}
