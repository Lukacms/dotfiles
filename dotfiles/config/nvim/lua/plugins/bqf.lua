return {
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
      -- pscrollup = "<C-b>",
      -- scroll down half-page in preview window
      -- pscrolldown = "<C-f>",
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
}
