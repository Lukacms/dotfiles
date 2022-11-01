-- {{@@ header() @@}}

local default_options = {
  noremap = true,
  silent = true,
}

return {
  map = function(mode, keys, action, opts)
    local options = default_options
    if opts then
      options = vim.tbl_extend('force', options, opts)
    end

    vim.keymap.set(mode, keys, action, options)
  end,
  buf_map = function(buffer, mode, keys, action, opts)
    local options = default_options

    options.buffer = buffer
    if opts then
      options = vim.tbl_extend('force', options, opts)
    end

    vim.keymap.set(mode, keys, action, options)
  end,

  highlight = function(group, color)
    local command = 'hi ' .. group .. ' '
    if color.style then
      command = command .. ' gui=' .. color.style
    end
    if color.fg then
      command = command .. ' guifg=' .. color.fg
    end
    if color.bg then
      command = command .. ' guibg=' .. color.bg
    end
    if color.sp then
      command = command .. ' guisp=' .. color.sp
    end

    vim.cmd(command)
  end,
}
