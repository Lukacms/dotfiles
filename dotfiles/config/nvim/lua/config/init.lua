local M = {}

---@class lukaNvimConfig
local defaults = {
  icons = {
    diagnostics = {
      Error = '',
      Warn = '',
      Hint = '',
      Info = '',
    },
    git = {
      removed = '',
      added = '✚',
      modified = '',
      deleted = '',
      renamed = '󰁕',
      untracked = '*',
      ignored = '',
      unstaged = '󰄱',
      staged = '',
      conflict = '',
    },
    kinds = {
      Array = '',
      Boolean = '',
      Class = '󰌗',
      Color = '󰏘',
      Constant = '',
      Constructor = '',
      Enum = '󰕘',
      EnumMember = '',
      Event = '',
      Field = '',
      File = '',
      Folder = '󰉋',
      Function = '󰊕',
      Interface = '󰜰',
      Key = '󰌋',
      Keyword = '',
      Macro = '󰉨',
      Method = '󰆧',
      Module = '󰅩',
      Namespace = '󰅩',
      Null = '',
      Object = '',
      Operator = '',
      Package = '',
      Property = '󰖷',
      Reference = '',
      Snippet = '',
      String = '',
      Struct = '󰟦',
      Text = '',
      TypeParameter = '',
      Unit = '',
      Value = '󰎠',
      Variable = '',
    },
    kinds_with_space = {},
  },
}

for name, value in pairs(defaults.icons.kinds) do
  defaults.icons.kinds[name] = value .. ' '
end

local options

function M.setup(opts)
  options = vim.tbl_deep_extend('force', defaults, opts or {})
  require('{{@@ user @@}}.config.autocmds')
end

M.did_init = false
function M.init()
  if not M.did_init then
    M.did_init = true
    require('{{@@ user @@}}.config.options')
    require('{{@@ user @@}}.config.keymaps')
  end
end

setmetatable(M, {
  __index = function(_, key)
    if options == nil then
      return vim.deepcopy(defaults)[key]
    end

    ---@cast options lukaNvimConfig
    return options[key]
  end,
})

return M
