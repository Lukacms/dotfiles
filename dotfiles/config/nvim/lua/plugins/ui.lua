return {
    {
        "hoob3rt/lualine.nvim",
        opts = function()
            local colors = require("highlights").colors

            local mode_highlight = function(highlight)
                return {
                    a = { bg = highlight, fg = colors.eclipse, gui = "bold" },
                    b = { bg = colors.eclipse, fg = highlight },
                    c = { bg = colors.nero, fg = colors.light_grey },
                }
            end

            local theme = {
                normal = mode_highlight(colors.picton_blue),
                insert = mode_highlight(colors.straw),
                visual = mode_highlight(colors.glabe_green),
            }

            local diag_icons = require('config').icons.diagnostics
            local diagnostics = {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                color_error = colors.vscRed,
                color_warn = colors.vscOrange,
                color_info = colors.vscYellow,
                color_hint = colors.vscFront,
                symbols = {
                  error = diag_icons.Error .. ' ',
                  warn = diag_icons.Warn .. ' ',
                  info = diag_icons.Hint .. ' ',
                  hint = diag_icons.Info .. ' ',
                },
            }

            local winbar_filename = {
                "filename",
                path = 1,
                shorting_target = 20,
            }

            local navic = require('nvim-navic')
                  return {
                    tabline = {
                      lualine_a = {
                        'tabs',
                      },
                    },
                    winbar = { lualine_c = { winbar_filename } },
                    inactive_winbar = { lualine_c = { winbar_filename } },
                    sections = {
                      lualine_a = { 'mode' },
                      lualine_b = { 'branch', diagnostics },
                      lualine_c = {
                        'filename',
                        {
                          function()
                            return navic.get_location()
                          end,
                          cond = function()
                            return navic.is_available()
                          end,
                        },
                      },
                      lualine_x = { 'encoding', 'fileformat' },
                      lualine_y = { 'filetype' },
                      lualine_z = { 'location', 'progress' },
                    },
                    options = {
                      theme = theme,
                      disabled_filetypes = { 'packer', 'neo-tree' },
                      ignore_focus = { 'neo-tree' },
                      globalstatus = true,
                    },
                    extensions = {},
                  }
                end,
                dependencies = {
                  { 'nvim-tree/nvim-web-devicons' },
                  {
                    'SmiteshP/nvim-navic',
                    dependencies = 'neovim/nvim-lspconfig',
                    opts = function()
                      local icons = require('config').icons.kinds

                      return { icons = icons }
                    end,
                  },
                },
    },

    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>n",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss all Notifications",
            },
        },
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        },
        init = function()
            -- when noice is not enabled, install notify on VeryLazy
            vim.notify = require("notify").setup({
                background_colour = "#000000",
            })
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
            },
        },
        -- stylua: ignore
        keys = {
            { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c",                 desc = "Redirect Cmdline" },
            { "<leader>snl", function() require("noice").cmd("last") end,                   desc = "Noice Last Message" },
            { "<leader>snh", function() require("noice").cmd("history") end,                desc = "Noice History" },
            { "<leader>sna", function() require("noice").cmd("all") end,                    desc = "Noice All" },
            { "<leader>snd", function() require("noice").cmd("dismiss") end,                desc = "Dismiss All" },
            -- { "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,              expr = true,              desc = "Scroll forward",  mode = { "i", "n", "s" } },
            -- { "<c-b>",       function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,              expr = true,              desc = "Scroll backward", mode = { "i", "n", "s" } },
        },
    },
    {
        "keklleo/tabline.nvim",
        opts = { enable = false },
        dependencies = {
            { "hoob3rt/lualine.nvim" },
            { "nvim-tree/nvim-web-devicons" },
        },
    },

    { "nvim-tree/nvim-web-devicons", lazy = true },

    { "norcalli/nvim-colorizer.lua", opts = { "*" } },

    { "luukvbaal/stabilize.nvim" },

    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require("nvim-autopairs").setup()
        end,
    },

    {
        "akinsho/git-conflict.nvim",
        version = "*",
        opts = {
            default_mappings = {
                ours = "o",
                theirs = "t",
                none = "0",
                both = "b",
                next = "n",
                prev = "p",
            },
            highlights = { -- They must have background color, otherwise the default color will be used
                incoming = "DiffAdd",
                current = "DiffText",
            },
        },
    },
}
