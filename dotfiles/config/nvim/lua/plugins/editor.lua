local utils = require("utils")

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        cmd = "Neotree",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" },
            { "MunifTanjim/nui.nvim" },
            {
                "s1n7ax/nvim-window-picker",
                tag = "v1.5",
                opts = function()
                    local colors = require("highlights").colors

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
            { "<C-b>", "<cmd>Neotree toggle<CR>" },
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

            default_component_configs = {
                indent = {
                    with_markers = false,
                },
                name = {
                    use_git_status_colors = false,
                },
                git_status = {
                    symbols = {
                        deleted = "",
                        renamed = "󰁕",
                        untracked = "*",
                    },
                },
            },

            filesystem = {
                hide_gitignored = true,
                follow_current_file = true,
                use_libuv_file_watcher = true,
                always_show = {
                    ".clang_format",
                    ".clang-tidy",
                },
            },
        },
    },

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
                            -- ["<esc><esc>"] = actions.close,
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
                    "nodes_modules",
                },
            }
        end,
    },

    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function(_, opts)
            local highlight = require("utils").highlight
            local colors = require("highlights").colors

            highlight("GitSignsAddNr", { bg = colors.clover, fg = "NONE" })
            highlight("GitSignsChangeNr", { bg = colors.raw_umber, fg = "NONE" })
            highlight("GitSignsDeleteNr", { bg = colors.bordeaux, fg = "NONE" })

            require("gitsigns").setup(opts)
        end,

        opts = {
            signs = {
                add = { numhl = "GitSignsAddNr" },
                change = { numhl = "GitSignsChangeNr" },
                delete = { numhl = "GitSignsDeleteNr" },
                topdelete = { numhl = "GitSignsDeleteNr" },
                changedelete = { numhl = "GitSignsChangeNr" },
            },
            signcolumn = false,
            numhl = true,
            linehl = false,
            word_diff = false,
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = true,
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local buf_map = require("utils").buf_map

                buf_map(bufnr, "n", "<leader>g", function()
                    gs.blame_line({ full = true })
                end)
            end,
        },
    },

    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    -- { "iamcco/markdown-preview.nvim" },
    { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            signs = true,
            sign_priority = 8,
            keywords = {
                FIX = {
                    icon = " ",
                    color = "error",
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            },
            merge_keywords = true,
            highlight = {
                before = "",
                keyword = "wide",
                after = "fg",
                pattern = [[.*<(KEYWORDS)\s*]],
                comments_only = true,
                max_line_len = 400,
            },
            colors = {
                error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
                warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
                info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
                hint = { "LspDiagnosticsDefaultHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                pattern = [[\b(KEYWORDS)]], -- ripgrep regex
            },
        },
    },

    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {

            use_diagnostic_signs = true,
        },
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        init = function()
            local bufnr = vim.api.nvim_get_current_buf()
            require("ufo").setFoldVirtTextHandler(bufnr, utils.fold_handler)
        end,
        opts = {
            open_fold_hl_timeout = 100,
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
            fold_virt_text_handler = utils.fold_handler,
        },
    },

    { "junegunn/vim-easy-align" },
    { "wesQ3/vim-windowswap" },

    -- {%@@ endif @@%}

    {
        "ntpeters/vim-better-whitespace",
        event = "BufReadPre",
        keys = {
            { "<leader><Space>", "<cmd>StripWhitespace<CR>" },
        },
    },

    {
        "kevinhwang91/nvim-bqf",
        opts = {
            -- Enable nvim-bqf in quickfix window automatically
            -- default = true
            auto_enable = true,
            -- Give the window magic, when the window is splited horizontally, keep
            --  the distance between the current line and the top/bottom border of neovim unchanged.
            --  It's a bit like a floating window, but the window is indeed a normal window, without
            --  any floating attributes.
            -- default = true
            magic_window = true,
            -- Resize quickfix window height automatically.
            --  Shrink higher height to size of list in quickfix window, otherwise extend height
            --  to size of list or to -- default height (10)
            -- default = false
            auto_resize_height = true,
            preview = {
                -- Enable preview in quickfix window automatically
                -- default = true
                auto_preview = true,
                -- Border and scroll bar chars, they respectively represent:
                --	vline, vline, hline, hline, ulcorner, urcorner, blcorner, brcorner, sbar
                -- default = {'│', '│', '─', '─', '╭', '╮', '╰', '╯', '█'}
                border_chars = { "│", "│", "─", "─", "╭", "╮", "╰", "╯", "█" },
                -- Show the window title
                -- default = true
                show_title = true,
                -- Delay time, to do syntax for previewed buffer, unit is millisecond
                -- default = 50
                delay_syntax = 50,
                -- The height of preview window for horizontal layout,
                --  large value (like 999) perform preview window as a "full" mode
                -- default = 15
                win_height = 15,
                -- The height of preview window for vertical layout
                -- default = 15,
                win_vheight = 15,
                -- Wrap the line, `:h wrap` for detail
                -- default = false
                wrap = false,
                -- Add label of current item buffer at the end of the item line
                -- default = true
                buf_label = true,
                -- A callback function to decide whether to preview while switching buffer,
                --  with (bufnr: number, qwinid: number) parameters
                -- default = nil
                should_preview_cb = nil,
            },
            -- The table for {function = key}
            func_map = {
                -- open the item under the cursor in quickfix window
                open = "<CR>",
                -- open the item, and close quickfix window
                openc = "o",
                -- use `drop` to open the item, and close quickfix window
                drop = "O",
                -- use `tab drop` to open the item, and close quickfix window
                -- tabdrop = '',
                -- open the item in a new tab
                tab = "t",
                -- open the item in a new tab, but stay at quickfix window
                tabb = "T",
                -- open the item in a new tab, and close quickfix window
                tabc = "<C-t>",
                -- open the item in vertical split
                split = "<C-x>",
                -- open the item in horizontal split
                vsplit = "<C-v>",
                -- go to previous file under the cursor in quickfix window
                prevfile = "<C-p>",
                -- go to next file under the cursor in quickfix window
                nextfile = "<C-n>",
                -- go to previous quickfix list in quickfix window
                prevhist = "<",
                -- go to next quickfix list in quickfix window
                nexthist = ">",
                -- go to last leaving position in quickfix window
                lastleave = "'\"",
                -- toggle sign and move cursor up
                stoggleup = "<S-Tab>",
                -- toggle sign and move cursor down
                stoggledown = "<Tab>",
                -- toggle multiple signs in visual mode
                stogglevm = "<Tab>",
                -- toggle signs for same buffers under the cursor
                stogglebuf = "'<Tab>",
                -- clear the signs in current quickfix list
                sclear = "z<Tab>",
                -- scroll up half-page in preview window
                pscrollup = "<C-b>",
                -- scroll down half-page in preview window
                pscrolldown = "<C-f>",
                -- scroll back to original position in preview window
                pscrollorig = "zo",
                -- toggle preview window between normal and max size
                ptogglemode = "zp",
                -- toggle preview for an item of quickfix list
                ptoggleitem = "p",
                -- toggle auto preview when cursor moved
                ptoggleauto = "P",
                -- create new list for signed items
                filter = "zn",
                -- create new list for non-signed items
                filterr = "zN",
                -- enter fzf mode
                fzffilter = "zf",
            },
            filter = {
                fzf = {
                    action_for = {
                        -- Press ctrl-t to open up the item in a new tab
                        -- default = 'tabedit'
                        ["ctrl-t"] = "tabedit",
                        -- Press ctrl-v to open up the item in a new vertical split
                        -- default = 'vsplit'
                        ["ctrl-v"] = "vsplit",
                        -- Press ctrl-x to open up the item in a new horizontal split
                        -- default = 'split'
                        ["ctrl-x"] = "split",
                        -- Press ctrl-q to toggle sign for the selected items
                        -- default = 'signtoggle'
                        ["ctrl-q"] = "signtoggle",
                        -- Press ctrl-c to close quickfix window and abort fzf
                        ["ctrl-c"] = "closeall",
                    },
                    -- Extra options for fzf
                    -- default = {'--bind', 'ctrl-o:toggle-all'}
                    extra_opts = { "--bind", "ctrl-o:toggle-all" },
                },
            },
        },
    },
}
