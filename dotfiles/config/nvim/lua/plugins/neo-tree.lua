return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "MunifTanjim/nui.nvim" },
      {
        "s1n7ax/nvim-window-picker",
        tag = "v1.5",
        opts = function()
          local colors = require("config.highlights").colors

          return {
            autoselect_one = true,
            include_current = true,
            filter_rules = {
              bo = {
                filetype = { "neo-tree", "neo-tree-popup", "notify", "Trouble" },
                buftype = { "terminal", "quickfix" },
              },
            },
            fg_color = colors.picton_blue,
            other_win_hl_color = colors.bordeaux,
          }
        end,
      },
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>" },
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>E", false },
      { "<leader>ge", false },
      { "<leader>be", false },
    },
    opts = {
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      sort_case_insensitive = true, -- used when sorting files and directories in the tree
      window = {
        mappings = {
          ["o"] = "open_with_window_picker",
        },
      },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
            "build",
          },
          hide_by_pattern = {
            "*.o",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            ".gitignore",
          },
          always_show_by_pattern = { -- uses glob style patterns
            ".env*",
            ".*.env",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            "node_modules",
          },
          never_show_by_pattern = { -- uses glob style patterns
          },
        },
      },
    },
  },
}
