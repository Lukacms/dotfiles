return {
  "linrongbin16/gitlinker.nvim",
  keys = {
    {
      "<leader>gy",
      "<cmd>GitLink<cr>",
      mode = { "n", "v" },
      desc = "Yank git permlink",
    },
    {
      "<leader>go",
      "<cmd>GitLink!<cr>",
      mode = { "n", "v" },
      desc = "Open git permlink",
    },
  },
  config = function()
    require("gitlinker").setup({
      -- print message in command line
      message = true,

      -- highlights the linked line(s) by the time in ms
      -- disable highlight by setting a value equal or less than 0
      highlight_duration = 500,

      -- router bindings
      router = {
        browse = {
          ["^github%.com"] = require("gitlinker.routers").github_browse,
          ["^gitlab%.com"] = require("gitlinker.routers").gitlab_browse,
          ["^gitlab.displayce%.com"] = require("gitlinker.routers").gitlab_browse,
        },
        blame = {
          ["^github%.com"] = require("gitlinker.routers").github_blame,
          ["^gitlab%.com"] = require("gitlinker.routers").gitlab_blame,
          ["^gitlab.displayce%.com"] = require("gitlinker.routers").gitlab_blame,
        },
      },

      -- enable debug
      debug = false,

      -- write logs to console(command line)
      console_log = false,

      -- write logs to file
      file_log = false,
    })
  end,
}
