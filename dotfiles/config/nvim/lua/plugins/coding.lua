return {
    -- {%@@ if profile != "lukac" @@%}

    { "b0o/schemastore.nvim" },

    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
            "jose-elias-alvarez/null-ls.nvim",
            "jose-elias-alvarez/typescript.nvim",
            "simrat39/rust-tools.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
    },

    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "BufReadPre",
        opts = {}
    },

    --[[ {
		"L3MON4D3/LuaSnip",
		version = "<CurrentMajor>.*",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })
		end,
		keys = {
			{
				"<C-l>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "i",
			},
			{
				"<C-h>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = "i",
			},
		},
	}, ]]

    {
        "hrsh7th/vim-vsnip",
        config = function()
            vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"

            local map = require("utils").map
            local options = { expr = true, noremap = true }

            map("i", "<C-l>", 'vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<C-l>"', options)
            map("s", "<C-l>", 'vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<C-l>"', options)
            map("s", "<C-k>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', options)
            map("i", "<C-k>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', options)
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            -- "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            -- "onsails/lspkind-nvim",
        },
        init = function(_)
            local highlight = require("utils").highlight
            local colors = require("highlights").colors
            local cmp = require("cmp")
            -- local lspkind = require("lspkind")

            highlight("CmpItemAbbrDeprecated", { style = "strikethrough", fg = colors.grey })

            highlight("CmpItemAbbrMatch", { bg = "NONE", fg = colors.picton_blue })
            highlight("CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = colors.picton_blue })

            highlight("CmpItemKindVariable", { bg = "NONE", fg = colors.columbia_blue })
            highlight("CmpItemKindInterface", { bg = "NONE", fg = colors.columbia_blue })
            highlight("CmpItemKindText", { bg = "NONE", fg = colors.columbia_blue })

            highlight("CmpItemKindFunction", { bg = "NONE", fg = colors.lilac })
            highlight("CmpItemKindMethod", { bg = "NONE", fg = colors.lilac })

            highlight("CmpItemKindKeyword", { bg = "NONE", fg = colors.light_grey })
            highlight("CmpItemKindProperty", { bg = "NONE", fg = colors.light_grey })
            highlight("CmpItemKindUnit", { bg = "NONE", fg = colors.light_grey })

            vim.opt.completeopt = { "menuone", "noselect" }
            -- Remove cmp status display
            vim.opt.shortmess:append("c")
        end,
        opts = function()
            local cmp = require("cmp")
            -- local lspkind = require("lspkind")
            -- local luasnip = require("luasnip")

            return {
                snippet = {
                    expand = function(args)
                        -- luasnip.lsp_expand(args.body)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },

                mapping = {
                    ["<C-Space>"] = cmp.mapping.complete({
                        config = {
                            sources = {
                                { name = "nvim_lsp" },
                                -- { name = "LuaSnip" },
                                { name = "vsnip" },
                                { name = "path" },
                                { name = "buffer" },
                            },
                        },
                    }),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                },

                sources = {
                    { name = "nvim_lsp" },
                    -- { name = "LuaSnip" },
                    { name = "vsnip" },
                    { name = "path" },
                    { name = "buffer" },
                },

                formatting = {
                    --[[ format = lspkind.cmp_format({
                        mode = "symbol",
                        maxwidth = "50",

                        symbol_map = {
                            Text = "",
                            Method = "",
                            Function = "",
                            Constructor = "",
                            Field = "ﴲ",
                            Variable = "[]",
                            Class = "",
                            Interface = "ﰮ",
                            Module = "",
                            Property = "襁",
                            Unit = "",
                            Value = "",
                            Enum = "練",
                            Keyword = "",
                            Snippet = "",
                            Color = "",
                            File = "",
                            Reference = "",
                            Folder = "",
                            EnumMember = "",
                            Constant = "ﲀ",
                            Struct = "ﳤ",
                            Event = "",
                            Operator = "",
                            TypeParameter = "",
                        },
                    }), ]]
                },
            }
        end,
    },

    -- Symbol tree
    {
        "simrat39/symbols-outline.nvim",
        keys = { { "<Leader>s", "<cmd>SymbolsOutlineOpen<CR>" } },
        opts = {}
    },
    { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },

    -- {%@@ endif @@%}

    {
        "numToStr/Comment.nvim",
        opts = {
            ignore = "^$",
            toggler = {
                line = "<Space>/",
            },
        },
    },

    {
        "MunifTanjim/prettier.nvim",
        opts = {
            single_quote = true,
            print_width = 100,
            jsx_single_quote = true,
            bracket_same_line = true,
        }
    },

    -- gdb debugger
    {
        "sakhnik/nvim-gdb"
    },

    -- just treesitter
    --[[ {
        "IndianBoy42/tree-sitter-just",
        config = function(plugin, opts)
            require('tree-sitter-just').setup({})
        end,
    }, ]]
    --[[ {
        "NoahTheDuke/vim-just",
        event = { "BufReadPre", "BufNewFile" },
        ft = { "\\cjustfile", "*.just", ".justfile" },
    } ]]
    --[[ {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
            require("go.format").gofmt()    -- gofmt only
            require("go.format").goimport() -- goimport + gofmt
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    } ]]

}
