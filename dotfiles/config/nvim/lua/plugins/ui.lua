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

            local diagnostics = {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                color_error = colors.sunset_orange,
                color_warn = colors.equator,
                color_info = colors.mountain_meadow,
                color_hint = colors.light_grey,
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
            }

            local winbar_filename = {
                "filename",
                path = 1,
                shorting_target = 20,
            }

            require("lualine").setup({
                tabline = {
                    lualine_c = { winbar_filename },
                    lualine_x = { require("tabline").tabline_tabs },
                },
                status_line = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", diagnostics },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat" },
                    lualine_y = { "filetype" },
                    lualine_z = { "location", "progress" },
                },
                options = {
                    theme = "codedark",
                    disabled_filetypes = { "packer", "neo-tree" },
                    ignore_focus = { "neo-tree" },
                    globalstatus = true,
                },
                extensions = {},
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
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
        opts = {
            enable = false,
            options = {
                section_separators = { "", "" },
                component_separators = { "", "" },
                max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
                show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
                show_devicons = true, -- this shows devicons in buffer section
                show_bufnr = false, -- this appends [bufnr] to buffer section,
                show_filename_only = false, -- shows base filename only instead of relative path in filename
                modified_icon = "+ ", -- change the default modified icon
                modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
                show_tabs_only = true, -- this shows only tabs instead of tabs + buffers
            },
        },
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
