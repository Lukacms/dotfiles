return {

    {
        'nvim-neotest/neotest',
        lazy = true,
        dependencies = {
            { 'nvim-neotest/neotest-go', lazy = true },
            'nvim-neotest/neotest-python',
            'alfaix/neotest-gtest',
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim',
        },
        config = (function()
            local map = require('utils').map

            map('n', '<c-t><c-t>', ':lua require("neotest").summary.toggle()<CR>')
            map('n', '<c-t>r', ':lua require("neotest").run.run()<CR>')
            map('n', '<c-t>R', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
        end)(),
        opts = function()
            return {
                -- default summary config to serve as a quick access reminder
                -- https://github.com/nvim-neotest/neotest/blob/master/lua/neotest/config/init.lua
                adapters = {
                    require('neotest-python'),
                    require('neotest-gtest'),
                    require('neotest-go')({
                        args = { '-timeout=30s' }
                    })
                },
                summary = {
                    enabled = true,
                    animated = true,
                    follow = true,
                    expand_errors = true,
                    open = 'botright vsplit | vertical resize 50',
                    mappings = {
                        expand = { '<CR>', '<2-LeftMouse>' },
                        expand_all = 'e',
                        output = 'o',
                        short = 'O',
                        attach = 'a',
                        jumpto = 'i',
                        stop = 'u',
                        run = 'r',
                        debug = 'd',
                        mark = 'm',
                        run_marked = 'R',
                        debug_marked = 'D',
                        clear_marked = 'M',
                        target = 't',
                        clear_target = 'T',
                        next_failed = 'J',
                        prev_failed = 'K',
                    },
                },
                quickfix = {
                    enabled = true,
                    open = false,
                },
            }
        end
    }
}
