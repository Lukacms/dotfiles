-- Heavily inspired by https://github.com/stevearc/qf_helper.nvim

local map = LazyVim.safe_keymap_set

-- Merge tables, overwriting elements from tbl1 with elements from tbl2.
local function mergetbl(tbl1, tbl2)
  tbl1 = tbl1 or {}
  tbl2 = tbl2 or {}
  for k, v in pairs(tbl2) do
    tbl1[k] = v
  end
  return tbl1
end

local M = {}

local config = {
  -- Prefer using the loclist when guessing the list type for an action.
  prefer_loclist = true,
}

-- Get the winid for the list of given type.
--
-- type: list type (default to `get_active_list()`)
function M.get_winid(type)
  local winid = M.get_list(type, { winid = 0 }).winid
  return winid ~= 0 and winid or nil
end

-- Checks whether the list of given type is currently open.
--
-- type: list type (default to `get_active_list()`)
function M.is_open(type)
  type = type and type or M.get_active_list().qftype
  return M.get_winid(type) ~= nil
end

-- Get the content of the list of given type.
--
-- type: list type (default to `get_active_list()`)
-- opts: extra options passed to `vim.fn.getloclist` or `vim.fn.getqflist`
function M.get_list(type, opts)
  type = type and type or M.get_active_list().qftype
  if opts == nil then
    return type == "l" and vim.fn.getloclist(0) or vim.fn.getqflist()
  else
    return type == "l" and vim.fn.getloclist(0, opts) or vim.fn.getqflist(opts)
  end
end

-- Get position in the list of given type.
--
-- type: list type (default to `get_active_list()`)
function M.get_pos(type)
  return M.get_list(type, { idx = 0 }).idx
end

-- Open the list of given type.
--
-- type: list type (default to `get_active_list()`)
-- opts: extra options
-- 	- even_if_empty (bool, default false): open the list even if it is empty
function M.open(type, opts)
  type = type or M.get_active_list().qftype
  opts = mergetbl({ even_if_empty = false }, opts)
  if opts.even_if_empty then
    vim.cmd(type .. "open")
  else
    vim.cmd(type .. "window")
  end
end

-- Close the list of given type.
--
-- type: list type (default to `get_active_list()`)
function M.close(type)
  type = type and type or M.get_active_list().qftype
  vim.cmd(type .. "close")
end

-- Navigate through the list of given type.
--
-- type: list type (default to `get_active_list()`)
-- steps: number of steps to navigate (direction depends on sign)
-- opts: extra options
-- 	- wrap (bool, default true): wrap at the end or beginning of the list
function M.navigate(type, steps, opts)
  type = type and type or M.get_active_list().qftype
  opts = mergetbl({ wrap = true }, opts)
  local list = M.get_list(type)
  if vim.tbl_isempty(list) then
    return
  end
  local pos = M.get_pos(type) - 1 + steps
  if opts.wrap then
    pos = pos % vim.tbl_count(list)
  end
  pos = pos + 1
  vim.cmd(pos .. type .. type)
end

-- Move to the next item in list of given type.
--
-- type: list type (default to `get_active_list()`)
-- opts: extra options
-- 	- wrap (bool, default true): wrap at the end of the list
function M.next(type, opts)
  M.navigate(type, 1, opts)
end

-- Move to the previous item in list of given type.
--
-- type: list type (default to `get_active_list()`)
-- opts: extra options
-- 	- wrap (bool, default true): wrap at the beginning of the list
function M.prev(type, opts)
  M.navigate(type, -1, opts)
end

-- Move to the first item in list of given type.
--
-- type: list type (default to `get_active_list()`)
function M.first(type)
  type = type and type or M.get_active_list().qftype
  vim.cmd("silent! " .. type .. "first")
end

-- Move to the last item in list of given type.
--
-- type: list type (default to `get_active_list()`)
function M.last(type)
  type = type and type or M.get_active_list().qftype
  vim.cmd("silent! " .. type .. "last")
end

-- Get the current list window type, if any.
--
-- winid: list window id (default to the current window id)
function M.get_win_type(winid)
  winid = winid or vim.api.nvim_get_current_win()
  local info = vim.fn.getwininfo(winid)[1]
  if info.quickfix == 0 then
    return ""
  elseif info.loclist == 0 then
    return "c"
  else
    return "l"
  end
end

-- Get the currently active list or default to preferred list (see `config.prefer_loclist`).
function M.get_active_list()
  local loclist = vim.fn.getloclist(0)
  local qflist = vim.fn.getqflist()

  local lret = { qftype = "l", list = loclist }
  local cret = { qftype = "c", list = qflist }
  local wintype = M.get_win_type()
  if wintype == "c" then
    return cret
  elseif wintype == "l" then
    return lret
  end
  -- If loclist is empty, use quickfix
  if vim.tbl_isempty(loclist) then
    return cret
    -- If quickfix is empty, use loclist
  elseif vim.tbl_isempty(qflist) then
    return lret
  elseif M.is_open("c") then
    if not M.is_open("l") then
      return cret
    end
  elseif M.is_open("l") then
    return lret
  end
  -- They're either both empty or both open
  return config.prefer_loclist and lret or cret
end

-- Toggle the visibilty of the list of given type.
--
-- type: list type (default to `get_active_list()`)
-- opts: extra options
-- 	- even_if_empty (bool, default false): open the list even if it is empty
function M.toggle(type, opts)
  opts = mergetbl({ even_if_empty = false }, opts)
  if M.is_open(type) then
    M.close(type)
  else
    M.open(type, opts)
  end
end

-- Setup QF helper
--
-- config: extra options
-- 	- default_bindings (bool, default true): set default bindings
function M.setup(cfg)
  cfg = mergetbl({ default_bindings = true }, cfg)

  -- QFToggle[!] [<type>]: Toggle the visibilty of the list of given type.
  -- ! (bang): if present, force opens the list even if it is empty
  -- type: list type (either 'c' for quickfix or 'l' for loclist
  vim.api.nvim_create_user_command("QFToggle", function(opts)
    M.toggle(opts.fargs[1], { even_if_empty = opts.bang })
  end, { bang = true, nargs = "?" })

  -- QFOpen[!] [<type>]: Open the list of given type.
  -- ! (bang): if present, force opens the list even if it is empty
  -- type: list type (either 'c' for quickfix or 'l' for loclist
  vim.api.nvim_create_user_command("QFOpen", function(opts)
    M.open(opts.fargs[1], { even_if_empty = opts.bang })
  end, { bang = true, nargs = "?" })

  -- QFClose [<type>]: Close the list of given type.
  -- type: list type (either 'c' for quickfix or 'l' for loclist
  vim.api.nvim_create_user_command("QFClose", function(opts)
    M.close(opts.fargs[1])
  end, { nargs = "?" })

  -- QFNavigate[!] <steps> [<type>]: Navigate through the list of given type.
  -- ! (bang): if present, wrap at the end or beginning of the list
  -- steps: number of steps to navigate (direction depends on sign)
  -- type: list type (either 'c' for quickfix or 'l' for loclist
  vim.api.nvim_create_user_command("QFNavigate", function(opts)
    M.navigate(opts.fargs[2], opts.fargs[1], { wrap = opts.bang })
  end, { bang = true, nargs = "+" })

  -- QFPrev[!] [<type>]: Move to the previous item in list of given type.
  -- ! (bang): if present, wrap at the beginning of the list
  -- type: list type (either 'c' for quickfix or 'l' for loclist
  vim.api.nvim_create_user_command("QFPrev", function(opts)
    M.prev(opts.fargs[1], { wrap = opts.bang })
  end, { bang = true, nargs = "?" })

  -- QFNext[!] [<type>]: Move to the next item in list of given type.
  -- ! (bang): if present, wrap at the end of the list
  -- type: list type (either 'c' for quickfix or 'l' for loclist
  vim.api.nvim_create_user_command("QFNext", function(opts)
    M.next(opts.fargs[1], { wrap = opts.bang })
  end, { bang = true, nargs = "?" })

  -- QFFirst [<type>]: Move to the first item in list of given type.
  -- type: list type (either 'c' for quickfix or 'l' for loclist
  vim.api.nvim_create_user_command("QFFirst", function(opts)
    M.first(opts.fargs[1])
  end, { nargs = "?" })

  -- QFLast [<type>]: Move to the last item in list of given type.
  -- type: list type (either 'c' for quickfix or 'l' for loclist
  vim.api.nvim_create_user_command("QFLast", function(opts)
    M.last(opts.fargs[1])
  end, { nargs = "?" })

  if cfg.default_bindings then
    map("n", "<leader>q", "<cmd>QFToggle<CR>")
    map("n", "<leader>Q", "<cmd>QFToggle! c<CR>")
    map("n", "<leader>L", "<cmd>QFToggle! l<CR>")
    map("n", "<C-[>", "<cmd>QFPrev!<CR>")
    map("n", "<C-]>", "<cmd>QFNext!<CR>")
    map("n", "[G", "<cmd>QFFirst<CR>")
    map("n", "]G", "<cmd>QFLast<CR>")
    -- Fold
    map("n", "<Space>", "za")
  end
end

return M
