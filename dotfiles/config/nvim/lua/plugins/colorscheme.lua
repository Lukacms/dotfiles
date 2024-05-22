return {
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
        opts = {
            transparent = false,
            italic_comments = true,
            color_overrides = {
                vscFront = "#d4d4d4",
                vscBack = "#2E3440",
                vscLineNumber = "#D7BA7D",
                vscFoldBackground = "#202d39",
                -- Syntax colors
                vscGray = "#808080",
                vscViolet = "#646695",
                vscBlue = "#569CD6",
                vscAccentBlue = "#4FC1FE",
                vscDarkBlue = "#223E55",
                vscMediumBlue = "#18a2fe",
                vscLightBlue = "#9CDCFE",
                vscGreen = "#808080",
                vscBlueGreen = "#4EC9B0",
                vscLightGreen = "#B5CEA8",
                vscRed = "#F44747",
                vscOrange = "#CE9178",
                vscLightRed = "#D16969",
                vscYellowOrange = "#D7BA7D",
                vscYellow = "#DCDCAA",
                vscDarkYellow = "#D9AA02",
                vscPink = "#C586B3",
            },
            group_overrides = {
                -- this supports the same val table as vim.api.nvim_set_hl
                -- use colors from this colorscheme by requiring vscode.colors!
                Cursor = {
                    fg = "#646695",
                    bg = "#B5CEA8",
                    bold = false,
                },
            },
        },
        config = function(plugin, opts)
            require("vscode").setup(opts)
            require("vscode").load()
            require("notify").setup({
                background_color = "#000000",
            })
        end,
    },
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        -- event = "LazyFile",
        opts = {
            symbol = "▏",
            -- symbol = "│",
            options = { try_as_border = true },
            draw = {
                delay = 10,
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
}
