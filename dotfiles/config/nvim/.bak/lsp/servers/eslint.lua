local M = {}

M.setup = function(on_attach, capabilities)
    require "lspconfig".eslint.setup({
        capabilities = capabilities,
        name = 'eslint',
        cmd = { 'vscode-eslint-language-server', '--stdio' },
        filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
            'vue',
            'svelte',
        },
        settings = {
            codeAction = {
                disableRuleComment = {
                    enable = true,
                    location = 'separateLine',
                },
                showDocumentation = {
                    enable = true,
                },
            },
            codeActionOnSave = {
                enable = true,
                mode = 'all',
            },
            format = false,
            nodePath = '',
            onIgnoredFiles = 'off',
            packageManager = 'yarn',
            quiet = false,
            rulesCustomizations = {},
            run = 'onType',
            useESLintClass = false,
            validate = 'on',
            workingDirectory = {
                mode = 'location',
            },
        },
    })
end

return M
