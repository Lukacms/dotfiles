-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lukac/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lukac/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lukac/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lukac/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lukac/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nÇ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ftoggler\1\0\1\tline\r<Space>/\rmappings\1\0\1\nbasic\2\1\0\1\vignore\a^$\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line~\1\1\t\0\t\0\0156\1\0\0009\1\1\0019\1\2\0016\2\3\0'\4\4\0B\2\2\0029\2\5\2\18\3\2\0\18\5\0\0'\6\6\0'\a\a\0003\b\b\0B\3\5\0012\0\0ÄK\0\1\0\0\14<leader>g\6n\fbuf_map\nutils\frequire\rgitsigns\vloaded\fpackage™\5\1\0\a\0\"\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\1\18\2\0\0'\4\5\0005\5\a\0009\6\6\1=\6\b\5B\2\3\1\18\2\0\0'\4\t\0005\5\v\0009\6\n\1=\6\b\5B\2\3\1\18\2\0\0'\4\f\0005\5\14\0009\6\r\1=\6\b\5B\2\3\0016\2\0\0'\4\15\0B\2\2\0029\2\16\0025\4\28\0005\5\18\0005\6\17\0=\6\19\0055\6\20\0=\6\21\0055\6\22\0=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\5=\5\29\0045\5\30\0=\5\31\0043\5 \0=\5!\4B\2\2\1K\0\1\0\14on_attach\0\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\nsigns\1\0\6\15signcolumn\1\nnumhl\2\23current_line_blame\2\24attach_to_untracked\2\14word_diff\1\vlinehl\1\17changedelete\1\0\1\nnumhl\21GitSignsChangeNr\14topdelete\1\0\1\nnumhl\21GitSignsDeleteNr\vdelete\1\0\1\nnumhl\21GitSignsDeleteNr\vchange\1\0\1\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\1\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\1\0\1\afg\tNONE\rbordeaux\21GitSignsDeleteNr\1\0\1\afg\tNONE\14raw_umber\21GitSignsChangeNr\abg\1\0\1\afg\tNONE\vclover\18GitSignsAddNr\vcolors\15highlights\14highlight\nutils\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\2\n™\1\0\0\6\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0B\1\2\1\18\1\0\0'\3\6\0'\4\a\0'\5\b\0B\1\4\1K\0\1\0&:Trouble document_diagnostics<CR>\n<C-d>\6n\1\0\1\25use_diagnostic_signs\2\nsetup\ftrouble\bmap\nutils\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nö\1\0\1\4\1\f\0\0225\1\4\0005\2\0\0=\0\1\2-\3\0\0009\3\2\3=\3\3\2=\2\5\0015\2\6\0-\3\0\0009\3\2\3=\3\1\2=\0\3\2=\2\a\0015\2\t\0-\3\0\0009\3\b\3=\3\1\2-\3\0\0009\3\n\3=\3\3\2=\2\v\1L\1\2\0\0¿\6c\15light_grey\1\0\0\tnero\6b\1\0\0\6a\1\0\0\afg\feclipse\abg\1\0\1\bgui\tbold§\a\1\0\n\0006\0J6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\1\3\0005\2\5\0\18\3\1\0009\5\4\0B\3\2\2=\3\6\2\18\3\1\0009\5\a\0B\3\2\2=\3\b\2\18\3\1\0009\5\t\0B\3\2\2=\3\n\0025\3\v\0005\4\f\0=\4\r\0039\4\14\0=\4\15\0039\4\16\0=\4\17\0039\4\18\0=\4\19\0039\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0006\5\0\0'\a\25\0B\5\2\0029\5\26\0055\a\29\0005\b\27\0004\t\3\0>\4\1\t=\t\28\b=\b\30\a5\b\31\0004\t\3\0>\4\1\t=\t\28\b=\b \a5\b\"\0005\t!\0=\t#\b5\t$\0>\3\2\t=\t%\b5\t&\0=\t\28\b5\t'\0=\t(\b5\t)\0=\t*\b5\t+\0=\t,\b=\b-\a5\b.\0=\2/\b5\t0\0=\t1\b5\t2\0=\t3\b=\b4\a4\b\0\0=\b5\aB\5\2\0012\0\0ÄK\0\1\0\15extensions\foptions\17ignore_focus\1\2\0\0\rneo-tree\23disabled_filetypes\1\3\0\0\vpacker\rneo-tree\ntheme\1\0\1\17globalstatus\2\16status_line\14lualine_z\1\3\0\0\rlocation\rprogress\14lualine_y\1\2\0\0\rfiletype\14lualine_x\1\3\0\0\rencoding\15fileformat\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\20inactive_winbar\1\0\0\vwinbar\1\0\0\14lualine_c\1\0\0\nsetup\flualine\1\2\2\0\rfilename\tpath\3\1\20shorting_target\3\20\fsymbols\1\0\4\nerror\tÔÄç \twarn\tÔÑ™ \thint\tÔÑ® \tinfo\tÔÑ© \15color_hint\15light_grey\15color_info\20mountain_meadow\15color_warn\fequator\16color_error\18sunset_orange\fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\vvisual\16glabe_green\vinsert\nstraw\vnormal\1\0\0\16picton_blue\0\vcolors\15highlights\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n±\6\0\0\b\0 \0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\17\0005\4\15\0005\5\5\0005\6\6\0=\6\a\0055\6\b\0005\a\t\0=\a\n\6=\6\v\0055\6\f\0005\a\r\0=\a\n\6=\6\14\5=\5\16\4=\4\18\0035\4\20\0005\5\19\0=\5\21\0045\5\22\0=\5\23\0045\5\25\0005\6\24\0=\6\26\5=\5\27\4=\4\28\3B\1\2\1\18\1\0\0'\3\29\0'\4\30\0'\5\31\0B\1\4\1K\0\1\0\29:NeoTreeRevealToggle<CR>\n<C-b>\6n\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\2\fdeleted\bÔëò\14untracked\6*\tname\1\0\1\26use_git_status_colors\1\vindent\1\0\0\1\0\1\17with_markers\1\vwindow\1\0\0\rmappings\1\0\0\6a\1\0\1\14show_path\rrelative\1\2\0\0\badd\6P\vconfig\1\0\1\14use_float\2\1\2\0\0\19toggle_preview\f<space>\1\2\1\0\16toggle_node\vnowait\1\1\0\21\n<esc>\19revert_preview\6x\21cut_to_clipboard\6R\frefresh\6<\16prev_source\6r\vrename\6z\20close_all_nodes\6d\vdelete\6m\tmove\6S\15open_split\6A\18add_directory\6?\14show_help\6q\17close_window\6C\15close_node\6w\28open_with_window_picker\6>\16next_source\6y\22copy_to_clipboard\6p\25paste_from_clipboard\6c\tcopy\6o\28open_with_window_picker\6t\16open_tabnew\6s\16open_vsplit\nsetup\rneo-tree\bmap\nutils\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimı\r\1\0\14\0P\0ô\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0026\3\0\0'\5\5\0B\3\2\0029\3\6\3\18\4\2\0'\6\a\0005\a\b\0009\b\t\3=\b\n\aB\4\3\1\18\4\2\0'\6\v\0005\a\f\0009\b\r\3=\b\n\aB\4\3\1\18\4\2\0'\6\14\0005\a\15\0009\b\r\3=\b\n\aB\4\3\1\18\4\2\0'\6\16\0005\a\17\0009\b\18\3=\b\n\aB\4\3\1\18\4\2\0'\6\19\0005\a\20\0009\b\18\3=\b\n\aB\4\3\1\18\4\2\0'\6\21\0005\a\22\0009\b\18\3=\b\n\aB\4\3\1\18\4\2\0'\6\23\0005\a\24\0009\b\25\3=\b\n\aB\4\3\1\18\4\2\0'\6\26\0005\a\27\0009\b\25\3=\b\n\aB\4\3\1\18\4\2\0'\6\28\0005\a\29\0009\b\30\3=\b\n\aB\4\3\1\18\4\2\0'\6\31\0005\a \0009\b\30\3=\b\n\aB\4\3\1\18\4\2\0'\6!\0005\a\"\0009\b\30\3=\b\n\aB\4\3\0019\4#\0005\6'\0005\a%\0003\b$\0=\b&\a=\a(\0065\a3\0009\b)\0009\b*\b5\n1\0005\v/\0004\f\5\0005\r+\0>\r\1\f5\r,\0>\r\2\f5\r-\0>\r\3\f5\r.\0>\r\4\f=\f0\v=\v2\nB\b\2\2=\b4\a9\b)\0009\b5\bB\b\1\2=\b6\a9\b)\0009\b7\b5\n8\0B\b\2\2=\b9\a9\b)\0009\b:\bB\b\1\2=\b;\a9\b)\0009\b<\bB\b\1\2=\b=\a=\a)\0064\a\5\0005\b>\0>\b\1\a5\b?\0>\b\2\a5\b@\0>\b\3\a5\bA\0>\b\4\a=\a0\0065\aF\0009\bB\0015\nC\0005\vD\0=\vE\nB\b\2\2=\bG\a=\aH\6B\4\2\0016\4I\0009\4J\0045\5L\0=\5K\0046\4I\0009\4J\0049\4M\4\18\6\4\0009\4N\4'\aO\0B\4\3\1K\0\1\0\6c\vappend\14shortmess\1\3\0\0\fmenuone\rnoselect\16completeopt\bopt\bvim\15formatting\vformat\1\0\0\15symbol_map\1\0\25\14Interface\bÔ∞Æ\tFile\bÔúì\nClass\bÔ†ñ\14Reference\bÔúú\rVariable\n[Óúñ]\vFolder\bÔùä\nField\bÔ¥≤\15EnumMember\bÔÖù\16Constructor\bÔê•\rConstant\bÔ≤Ä\rFunction\bÔûî\vStruct\bÔ≥§\vMethod\bÔö¶\nEvent\bÔÉß\tText\bÔíû\rOperator\bÔó´\nColor\bÔ£ó\18TypeParameter\bÔûÉ\fSnippet\bÔÉÑ\fKeyword\bÔ†ä\tEnum\bÔ©ó\nValue\bÔ¢ü\tUnit\bÔëµ\rProperty\bÔ™∂\vModule\bÔô®\1\0\2\rmaxwidth\a50\tmode\vsymbol\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\21select_prev_item\n<Tab>\21select_next_item\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\1\0\0\vconfig\1\0\0\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\rcomplete\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\1\0\1\abg\tNONE\20CmpItemKindUnit\1\0\1\abg\tNONE\24CmpItemKindProperty\15light_grey\1\0\1\abg\tNONE\23CmpItemKindKeyword\1\0\1\abg\tNONE\22CmpItemKindMethod\nlilac\1\0\1\abg\tNONE\24CmpItemKindFunction\1\0\1\abg\tNONE\20CmpItemKindText\1\0\1\abg\tNONE\25CmpItemKindInterface\18columbia_blue\1\0\1\abg\tNONE\24CmpItemKindVariable\1\0\1\abg\tNONE\26CmpItemAbbrMatchFuzzy\16picton_blue\1\0\1\abg\tNONE\21CmpItemAbbrMatch\afg\tgrey\1\0\1\nstyle\18strikethrough\26CmpItemAbbrDeprecated\vcolors\15highlights\14highlight\nutils\flspkind\bcmp\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\ne\0\2\b\2\2\0\14-\2\0\0009\2\0\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0-\3\1\0009\3\1\3\18\5\0\0\18\6\1\0\18\a\2\0B\3\4\1K\0\1\0\0¿\0\0\19set_ls_keymaps\23disable_formatting+\0\2\6\1\1\0\6-\2\0\0009\2\0\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\0¿\14on_attachü\1\1\1\4\2\t\0\0203\1\0\0009\2\1\0\15\0\2\0X\3\1Ä3\1\2\0005\2\3\0=\1\4\0029\3\5\0=\3\5\0029\3\6\0=\3\6\2-\3\1\0=\3\a\0029\3\b\0\15\0\3\0X\4\2Ä9\3\b\0=\3\b\0022\0\0ÄL\2\2\0\1¿\2Ä\14filetypes\17capabilities\rsettings\bcmd\14on_attach\1\0\0\0\21custom_on_attach\0Â\t\1\0\15\0/\0n6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0026\3\0\0'\5\a\0B\3\2\0029\3\b\3\18\5\2\0B\3\2\2\18\2\3\0004\3\f\0006\4\0\0'\6\t\0B\4\2\2>\4\1\0036\4\0\0'\6\n\0B\4\2\2>\4\2\0036\4\0\0'\6\v\0B\4\2\2>\4\3\0035\4\f\0>\4\4\0035\4\r\0>\4\5\0035\4\14\0>\4\6\0035\4\15\0>\4\a\0035\4\16\0>\4\b\0035\4\17\0>\4\t\0035\4\18\0>\4\n\0035\4\19\0>\4\v\0036\4\0\0'\6\20\0B\4\2\0019\4\21\0029\4\22\0049\4\23\4+\5\2\0=\5\24\0046\4\3\0009\4\4\0049\4\25\0046\5\3\0009\5\4\0059\5\27\0056\a\3\0009\a\4\a9\a\28\a9\a\29\a5\b\30\0005\t\31\0=\t \bB\5\3\2=\5\26\0046\4\3\0009\4!\0049\4\"\4'\6#\0005\a$\0B\4\3\0016\4\3\0009\4!\0049\4\"\4'\6%\0005\a&\0B\4\3\0016\4\3\0009\4!\0049\4\"\4'\6'\0005\a(\0B\4\3\0016\4\3\0009\4!\0049\4\"\4'\6)\0005\a*\0B\4\3\0013\4+\0006\5,\0\18\a\3\0B\5\2\4X\b\aÄ9\n-\t8\n\n\0009\n.\n\18\f\4\0\18\14\t\0B\f\2\0A\n\0\1E\b\3\3R\b˜\1272\0\0ÄK\0\1\0\nsetup\tname\vipairs\0\1\0\2\ttext\bÔÑ®\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\bÔÑ©\vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\bÔÑ™\vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\bÔÄç\vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\17virtual_text\1\0\1\vprefix\bÓäÖ\1\0\2\14underline\2\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\19snippetSupport\19completionItem\15completion\17textDocument\30plugins.lspconfig.null-ls\1\0\1\tname\16tailwindcss\1\0\1\tname\fpyright\1\0\1\tname\vyamlls\1\0\1\tname\vjsonls\1\0\1\tname\thtml\1\0\1\tname\rdockerls\1\0\1\tname\ncssls\1\0\1\tname\vbashls\29plugins.lspconfig.texlab\"plugins.lspconfig.sumneko_lua\29plugins.lspconfig.clangd\25default_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\bvim\28plugins.lspconfig.utils\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nΩ\4\0\0\5\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0004\4\0\0=\4\v\0035\4\f\0=\4\r\3=\3\14\2B\0\2\1K\0\1\0\15playground\16keybindings\1\0\n\21toggle_hl_groups\6i\14show_help\6?\14goto_node\t<cr>\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\vupdate\6R\24toggle_query_editor\6o\fdisable\1\0\3\venable\2\20persist_queries\1\15updatetime\3\25\14highlight\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\21ensure_installed\1\0\0\1\18\0\0\tbash\vbibtex\6c\bcpp\bcss\15dockerfile\thtml\15javascript\tjson\njson5\nlatex\blua\rmarkdown\vpython\trust\15typescript\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n≈\2\0\0\a\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\v\0005\5\a\0005\6\6\0=\6\b\0055\6\t\0=\6\n\5=\5\f\4=\4\r\0039\4\14\0=\4\15\0039\4\16\0=\4\17\3B\1\2\1K\0\1\0\23other_win_hl_color\feclipse\rfg_color\16picton_blue\17filter_rules\abo\1\0\0\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\2\20include_current\1\19autoselect_one\2\nsetup\18window-picker\vcolors\15highlights\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nó\1\0\0\a\0\b\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0004\1\0\0\18\2\0\0'\4\3\0'\5\4\0'\6\5\0B\2\4\0016\2\0\0'\4\6\0B\2\2\0029\2\a\2\18\4\1\0B\2\2\1K\0\1\0\nsetup\20symbols-outline\28:SymbolsOutlineOpen<CR>\14<Leader>s\6n\bmap\nutils\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tabline.nvim"] = {
    config = { "\27LJ\2\n\127\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\2\27max_bufferline_percent\3\1\25show_tabline_buffers\3\0\nsetup\ftabline\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/tabline.nvim",
    url = "https://github.com/keklleo/tabline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÅ\b\0\0\n\0(\0@6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0026\2\0\0'\4\4\0B\2\2\0026\3\0\0'\5\3\0B\3\2\0029\3\5\0035\5\23\0005\6\6\0005\a\b\0005\b\a\0=\b\t\a5\b\n\0=\b\v\a=\a\f\0065\a\20\0005\b\14\0009\t\r\2=\t\15\b9\t\16\2=\t\17\b9\t\18\2=\t\19\b=\b\21\a=\a\22\6=\6\24\0055\6\26\0005\a\25\0=\a\27\6=\6\28\0055\6\29\0=\6\30\5B\3\2\0019\3\31\1'\5\27\0B\3\2\1\18\3\0\0'\5 \0'\6!\0'\a\"\0B\3\4\1\18\3\0\0'\5 \0'\6\15\0'\a#\0B\3\4\1\18\3\0\0'\5 \0'\6$\0'\a%\0B\3\4\1\18\3\0\0'\5 \0'\6&\0'\a'\0B\3\4\1K\0\1\0-:Telescope current_buffer_fuzzy_find<CR>\n<C-f>(:Telescope lsp_document_symbols<CR>\n<C-s>\29:Telescope live_grep<CR>\30:Telescope find_files<CR>\n<C-p>\6n\19load_extension\25file_ignore_patterns\1\6\0\0\21nodes_modules/.*\f.git/.*\14target/.*\n.yarn\29documentation/index.html\15extensions\bfzf\1\0\0\1\0\3\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\rdefaults\1\0\0\rmappings\6i\1\0\0\n<esc>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\3\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\19preview_cutoff\3x\vheight\4≥ÊÃô\3≥Ê¨ˇ\3\1\0\3\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\18preview_width\4ö≥ÊÃ\tô≥Üˇ\3\20prompt_position\btop\1\0\5\17entry_prefix\6 \20selection_caret\6 \18prompt_prefix\v Ôê¢  \20layout_strategy\15horizontal\21sorting_strategy\14ascending\nsetup\22telescope.actions\14telescope\bmap\nutils\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n‰\a\0\0\6\0)\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\3=\3\22\0025\3\23\0=\3\24\0025\3\26\0005\4\25\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\3=\3$\0025\3%\0005\4&\0=\4'\3=\3(\2B\0\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fpattern\17\\b(KEYWORDS)\fcommand\arg\vcolors\fdefault\1\3\0\0\15Identifier\f#7C3AED\thint\1\3\0\0\30LspDiagnosticsDefaultHint\f#10B981\tinfo\1\3\0\0%LspDiagnosticsDefaultInformation\f#2563EB\fwarning\1\4\0\0!LspDiagnosticsDefaultWarning\15WarningMsg\f#FBBF24\nerror\1\0\0\1\4\0\0\31LspDiagnosticsDefaultError\rErrorMsg\f#DC2626\14highlight\1\0\6\fpattern\21.*<(KEYWORDS)\\s*\nafter\afg\fkeyword\twide\vbefore\5\17max_line_len\3ê\3\18comments_only\2\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\tÔ°ß \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔôë \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\tÔÅ± \tHACK\1\0\2\ticon\tÔíê \ncolor\fwarning\tTODO\1\0\2\ticon\tÔÄå \ncolor\tinfo\bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ncolor\nerror\ticon\tÔÜà \1\0\3\19merge_keywords\2\18sign_priority\3\b\nsigns\2\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\n~\0\0\6\0\a\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\6\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\6v\25:StripWhitespace<CR>\20<leader><Space>\6n\bmap\nutils\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\nÈ\2\0\0\b\0\14\0\"6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\1\a\0\18\2\0\0'\4\b\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\v\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\v\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1K\0\1\0=vsnip#jumpable(-1) ? \"<Plug>(vsnip-jump-prev)\" : \"<C-h>\"\n<C-h>\6s=vsnip#jumpable(1)  ? \"<Plug>(vsnip-jump-next)\" : \"<C-l>\"\n<C-l>\6i\1\0\2\fnoremap\1\texpr\2\bmap\nutils\frequire $HOME/.config/nvim/snippets\22vsnip_snippet_dir\6g\bvim\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vscode.nvim"] = {
    config = { "\27LJ\2\nY\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20italic_comments\1\16transparent\2\nsetup\vvscode\frequire\0" },
    loaded = true,
    path = "/home/lukac/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\ne\0\2\b\2\2\0\14-\2\0\0009\2\0\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0-\3\1\0009\3\1\3\18\5\0\0\18\6\1\0\18\a\2\0B\3\4\1K\0\1\0\0¿\0\0\19set_ls_keymaps\23disable_formatting+\0\2\6\1\1\0\6-\2\0\0009\2\0\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\0¿\14on_attachü\1\1\1\4\2\t\0\0203\1\0\0009\2\1\0\15\0\2\0X\3\1Ä3\1\2\0005\2\3\0=\1\4\0029\3\5\0=\3\5\0029\3\6\0=\3\6\2-\3\1\0=\3\a\0029\3\b\0\15\0\3\0X\4\2Ä9\3\b\0=\3\b\0022\0\0ÄL\2\2\0\1¿\2Ä\14filetypes\17capabilities\rsettings\bcmd\14on_attach\1\0\0\0\21custom_on_attach\0Â\t\1\0\15\0/\0n6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0026\3\0\0'\5\a\0B\3\2\0029\3\b\3\18\5\2\0B\3\2\2\18\2\3\0004\3\f\0006\4\0\0'\6\t\0B\4\2\2>\4\1\0036\4\0\0'\6\n\0B\4\2\2>\4\2\0036\4\0\0'\6\v\0B\4\2\2>\4\3\0035\4\f\0>\4\4\0035\4\r\0>\4\5\0035\4\14\0>\4\6\0035\4\15\0>\4\a\0035\4\16\0>\4\b\0035\4\17\0>\4\t\0035\4\18\0>\4\n\0035\4\19\0>\4\v\0036\4\0\0'\6\20\0B\4\2\0019\4\21\0029\4\22\0049\4\23\4+\5\2\0=\5\24\0046\4\3\0009\4\4\0049\4\25\0046\5\3\0009\5\4\0059\5\27\0056\a\3\0009\a\4\a9\a\28\a9\a\29\a5\b\30\0005\t\31\0=\t \bB\5\3\2=\5\26\0046\4\3\0009\4!\0049\4\"\4'\6#\0005\a$\0B\4\3\0016\4\3\0009\4!\0049\4\"\4'\6%\0005\a&\0B\4\3\0016\4\3\0009\4!\0049\4\"\4'\6'\0005\a(\0B\4\3\0016\4\3\0009\4!\0049\4\"\4'\6)\0005\a*\0B\4\3\0013\4+\0006\5,\0\18\a\3\0B\5\2\4X\b\aÄ9\n-\t8\n\n\0009\n.\n\18\f\4\0\18\14\t\0B\f\2\0A\n\0\1E\b\3\3R\b˜\1272\0\0ÄK\0\1\0\nsetup\tname\vipairs\0\1\0\2\ttext\bÔÑ®\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\bÔÑ©\vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\bÔÑ™\vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\bÔÄç\vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\17virtual_text\1\0\1\vprefix\bÓäÖ\1\0\2\14underline\2\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\19snippetSupport\19completionItem\15completion\17textDocument\30plugins.lspconfig.null-ls\1\0\1\tname\16tailwindcss\1\0\1\tname\fpyright\1\0\1\tname\vyamlls\1\0\1\tname\vjsonls\1\0\1\tname\thtml\1\0\1\tname\rdockerls\1\0\1\tname\ncssls\1\0\1\tname\vbashls\29plugins.lspconfig.texlab\"plugins.lspconfig.sumneko_lua\29plugins.lspconfig.clangd\25default_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\bvim\28plugins.lspconfig.utils\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nö\1\0\1\4\1\f\0\0225\1\4\0005\2\0\0=\0\1\2-\3\0\0009\3\2\3=\3\3\2=\2\5\0015\2\6\0-\3\0\0009\3\2\3=\3\1\2=\0\3\2=\2\a\0015\2\t\0-\3\0\0009\3\b\3=\3\1\2-\3\0\0009\3\n\3=\3\3\2=\2\v\1L\1\2\0\0¿\6c\15light_grey\1\0\0\tnero\6b\1\0\0\6a\1\0\0\afg\feclipse\abg\1\0\1\bgui\tbold§\a\1\0\n\0006\0J6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\1\3\0005\2\5\0\18\3\1\0009\5\4\0B\3\2\2=\3\6\2\18\3\1\0009\5\a\0B\3\2\2=\3\b\2\18\3\1\0009\5\t\0B\3\2\2=\3\n\0025\3\v\0005\4\f\0=\4\r\0039\4\14\0=\4\15\0039\4\16\0=\4\17\0039\4\18\0=\4\19\0039\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0006\5\0\0'\a\25\0B\5\2\0029\5\26\0055\a\29\0005\b\27\0004\t\3\0>\4\1\t=\t\28\b=\b\30\a5\b\31\0004\t\3\0>\4\1\t=\t\28\b=\b \a5\b\"\0005\t!\0=\t#\b5\t$\0>\3\2\t=\t%\b5\t&\0=\t\28\b5\t'\0=\t(\b5\t)\0=\t*\b5\t+\0=\t,\b=\b-\a5\b.\0=\2/\b5\t0\0=\t1\b5\t2\0=\t3\b=\b4\a4\b\0\0=\b5\aB\5\2\0012\0\0ÄK\0\1\0\15extensions\foptions\17ignore_focus\1\2\0\0\rneo-tree\23disabled_filetypes\1\3\0\0\vpacker\rneo-tree\ntheme\1\0\1\17globalstatus\2\16status_line\14lualine_z\1\3\0\0\rlocation\rprogress\14lualine_y\1\2\0\0\rfiletype\14lualine_x\1\3\0\0\rencoding\15fileformat\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\20inactive_winbar\1\0\0\vwinbar\1\0\0\14lualine_c\1\0\0\nsetup\flualine\1\2\2\0\rfilename\tpath\3\1\20shorting_target\3\20\fsymbols\1\0\4\nerror\tÔÄç \twarn\tÔÑ™ \thint\tÔÑ® \tinfo\tÔÑ© \15color_hint\15light_grey\15color_info\20mountain_meadow\15color_warn\fequator\16color_error\18sunset_orange\fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\vvisual\16glabe_green\vinsert\nstraw\vnormal\1\0\0\16picton_blue\0\vcolors\15highlights\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nΩ\4\0\0\5\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0004\4\0\0=\4\v\0035\4\f\0=\4\r\3=\3\14\2B\0\2\1K\0\1\0\15playground\16keybindings\1\0\n\21toggle_hl_groups\6i\14show_help\6?\14goto_node\t<cr>\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\vupdate\6R\24toggle_query_editor\6o\fdisable\1\0\3\venable\2\20persist_queries\1\15updatetime\3\25\14highlight\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\21ensure_installed\1\0\0\1\18\0\0\tbash\vbibtex\6c\bcpp\bcss\15dockerfile\thtml\15javascript\tjson\njson5\nlatex\blua\rmarkdown\vpython\trust\15typescript\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n‰\a\0\0\6\0)\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\3=\3\22\0025\3\23\0=\3\24\0025\3\26\0005\4\25\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\3=\3$\0025\3%\0005\4&\0=\4'\3=\3(\2B\0\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fpattern\17\\b(KEYWORDS)\fcommand\arg\vcolors\fdefault\1\3\0\0\15Identifier\f#7C3AED\thint\1\3\0\0\30LspDiagnosticsDefaultHint\f#10B981\tinfo\1\3\0\0%LspDiagnosticsDefaultInformation\f#2563EB\fwarning\1\4\0\0!LspDiagnosticsDefaultWarning\15WarningMsg\f#FBBF24\nerror\1\0\0\1\4\0\0\31LspDiagnosticsDefaultError\rErrorMsg\f#DC2626\14highlight\1\0\6\fpattern\21.*<(KEYWORDS)\\s*\nafter\afg\fkeyword\twide\vbefore\5\17max_line_len\3ê\3\18comments_only\2\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\tÔ°ß \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔôë \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\tÔÅ± \tHACK\1\0\2\ticon\tÔíê \ncolor\fwarning\tTODO\1\0\2\ticon\tÔÄå \ncolor\tinfo\bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ncolor\nerror\ticon\tÔÜà \1\0\3\19merge_keywords\2\18sign_priority\3\b\nsigns\2\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n±\6\0\0\b\0 \0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\17\0005\4\15\0005\5\5\0005\6\6\0=\6\a\0055\6\b\0005\a\t\0=\a\n\6=\6\v\0055\6\f\0005\a\r\0=\a\n\6=\6\14\5=\5\16\4=\4\18\0035\4\20\0005\5\19\0=\5\21\0045\5\22\0=\5\23\0045\5\25\0005\6\24\0=\6\26\5=\5\27\4=\4\28\3B\1\2\1\18\1\0\0'\3\29\0'\4\30\0'\5\31\0B\1\4\1K\0\1\0\29:NeoTreeRevealToggle<CR>\n<C-b>\6n\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\2\fdeleted\bÔëò\14untracked\6*\tname\1\0\1\26use_git_status_colors\1\vindent\1\0\0\1\0\1\17with_markers\1\vwindow\1\0\0\rmappings\1\0\0\6a\1\0\1\14show_path\rrelative\1\2\0\0\badd\6P\vconfig\1\0\1\14use_float\2\1\2\0\0\19toggle_preview\f<space>\1\2\1\0\16toggle_node\vnowait\1\1\0\21\n<esc>\19revert_preview\6x\21cut_to_clipboard\6R\frefresh\6<\16prev_source\6r\vrename\6z\20close_all_nodes\6d\vdelete\6m\tmove\6S\15open_split\6A\18add_directory\6?\14show_help\6q\17close_window\6C\15close_node\6w\28open_with_window_picker\6>\16next_source\6y\22copy_to_clipboard\6p\25paste_from_clipboard\6c\tcopy\6o\28open_with_window_picker\6t\16open_tabnew\6s\16open_vsplit\nsetup\rneo-tree\bmap\nutils\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\n~\0\0\6\0\a\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\6\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\6v\25:StripWhitespace<CR>\20<leader><Space>\6n\bmap\nutils\frequire\0", "config", "vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20italic_comments\1\16transparent\2\nsetup\vvscode\frequire\0", "config", "vscode.nvim")
time([[Config for vscode.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nÇ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ftoggler\1\0\1\tline\r<Space>/\rmappings\1\0\1\nbasic\2\1\0\1\vignore\a^$\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line~\1\1\t\0\t\0\0156\1\0\0009\1\1\0019\1\2\0016\2\3\0'\4\4\0B\2\2\0029\2\5\2\18\3\2\0\18\5\0\0'\6\6\0'\a\a\0003\b\b\0B\3\5\0012\0\0ÄK\0\1\0\0\14<leader>g\6n\fbuf_map\nutils\frequire\rgitsigns\vloaded\fpackage™\5\1\0\a\0\"\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\1\18\2\0\0'\4\5\0005\5\a\0009\6\6\1=\6\b\5B\2\3\1\18\2\0\0'\4\t\0005\5\v\0009\6\n\1=\6\b\5B\2\3\1\18\2\0\0'\4\f\0005\5\14\0009\6\r\1=\6\b\5B\2\3\0016\2\0\0'\4\15\0B\2\2\0029\2\16\0025\4\28\0005\5\18\0005\6\17\0=\6\19\0055\6\20\0=\6\21\0055\6\22\0=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\5=\5\29\0045\5\30\0=\5\31\0043\5 \0=\5!\4B\2\2\1K\0\1\0\14on_attach\0\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\nsigns\1\0\6\15signcolumn\1\nnumhl\2\23current_line_blame\2\24attach_to_untracked\2\14word_diff\1\vlinehl\1\17changedelete\1\0\1\nnumhl\21GitSignsChangeNr\14topdelete\1\0\1\nnumhl\21GitSignsDeleteNr\vdelete\1\0\1\nnumhl\21GitSignsDeleteNr\vchange\1\0\1\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\1\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\1\0\1\afg\tNONE\rbordeaux\21GitSignsDeleteNr\1\0\1\afg\tNONE\14raw_umber\21GitSignsChangeNr\abg\1\0\1\afg\tNONE\vclover\18GitSignsAddNr\vcolors\15highlights\14highlight\nutils\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimı\r\1\0\14\0P\0ô\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0026\3\0\0'\5\5\0B\3\2\0029\3\6\3\18\4\2\0'\6\a\0005\a\b\0009\b\t\3=\b\n\aB\4\3\1\18\4\2\0'\6\v\0005\a\f\0009\b\r\3=\b\n\aB\4\3\1\18\4\2\0'\6\14\0005\a\15\0009\b\r\3=\b\n\aB\4\3\1\18\4\2\0'\6\16\0005\a\17\0009\b\18\3=\b\n\aB\4\3\1\18\4\2\0'\6\19\0005\a\20\0009\b\18\3=\b\n\aB\4\3\1\18\4\2\0'\6\21\0005\a\22\0009\b\18\3=\b\n\aB\4\3\1\18\4\2\0'\6\23\0005\a\24\0009\b\25\3=\b\n\aB\4\3\1\18\4\2\0'\6\26\0005\a\27\0009\b\25\3=\b\n\aB\4\3\1\18\4\2\0'\6\28\0005\a\29\0009\b\30\3=\b\n\aB\4\3\1\18\4\2\0'\6\31\0005\a \0009\b\30\3=\b\n\aB\4\3\1\18\4\2\0'\6!\0005\a\"\0009\b\30\3=\b\n\aB\4\3\0019\4#\0005\6'\0005\a%\0003\b$\0=\b&\a=\a(\0065\a3\0009\b)\0009\b*\b5\n1\0005\v/\0004\f\5\0005\r+\0>\r\1\f5\r,\0>\r\2\f5\r-\0>\r\3\f5\r.\0>\r\4\f=\f0\v=\v2\nB\b\2\2=\b4\a9\b)\0009\b5\bB\b\1\2=\b6\a9\b)\0009\b7\b5\n8\0B\b\2\2=\b9\a9\b)\0009\b:\bB\b\1\2=\b;\a9\b)\0009\b<\bB\b\1\2=\b=\a=\a)\0064\a\5\0005\b>\0>\b\1\a5\b?\0>\b\2\a5\b@\0>\b\3\a5\bA\0>\b\4\a=\a0\0065\aF\0009\bB\0015\nC\0005\vD\0=\vE\nB\b\2\2=\bG\a=\aH\6B\4\2\0016\4I\0009\4J\0045\5L\0=\5K\0046\4I\0009\4J\0049\4M\4\18\6\4\0009\4N\4'\aO\0B\4\3\1K\0\1\0\6c\vappend\14shortmess\1\3\0\0\fmenuone\rnoselect\16completeopt\bopt\bvim\15formatting\vformat\1\0\0\15symbol_map\1\0\25\14Interface\bÔ∞Æ\tFile\bÔúì\nClass\bÔ†ñ\14Reference\bÔúú\rVariable\n[Óúñ]\vFolder\bÔùä\nField\bÔ¥≤\15EnumMember\bÔÖù\16Constructor\bÔê•\rConstant\bÔ≤Ä\rFunction\bÔûî\vStruct\bÔ≥§\vMethod\bÔö¶\nEvent\bÔÉß\tText\bÔíû\rOperator\bÔó´\nColor\bÔ£ó\18TypeParameter\bÔûÉ\fSnippet\bÔÉÑ\fKeyword\bÔ†ä\tEnum\bÔ©ó\nValue\bÔ¢ü\tUnit\bÔëµ\rProperty\bÔ™∂\vModule\bÔô®\1\0\2\rmaxwidth\a50\tmode\vsymbol\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\21select_prev_item\n<Tab>\21select_next_item\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\1\0\0\vconfig\1\0\0\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\rcomplete\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\1\0\1\abg\tNONE\20CmpItemKindUnit\1\0\1\abg\tNONE\24CmpItemKindProperty\15light_grey\1\0\1\abg\tNONE\23CmpItemKindKeyword\1\0\1\abg\tNONE\22CmpItemKindMethod\nlilac\1\0\1\abg\tNONE\24CmpItemKindFunction\1\0\1\abg\tNONE\20CmpItemKindText\1\0\1\abg\tNONE\25CmpItemKindInterface\18columbia_blue\1\0\1\abg\tNONE\24CmpItemKindVariable\1\0\1\abg\tNONE\26CmpItemAbbrMatchFuzzy\16picton_blue\1\0\1\abg\tNONE\21CmpItemAbbrMatch\afg\tgrey\1\0\1\nstyle\18strikethrough\26CmpItemAbbrDeprecated\vcolors\15highlights\14highlight\nutils\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nó\1\0\0\a\0\b\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0004\1\0\0\18\2\0\0'\4\3\0'\5\4\0'\6\5\0B\2\4\0016\2\0\0'\4\6\0B\2\2\0029\2\a\2\18\4\1\0B\2\2\1K\0\1\0\nsetup\20symbols-outline\28:SymbolsOutlineOpen<CR>\14<Leader>s\6n\bmap\nutils\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
try_loadstring("\27LJ\2\n™\1\0\0\6\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0B\1\2\1\18\1\0\0'\3\6\0'\4\a\0'\5\b\0B\1\4\1K\0\1\0&:Trouble document_diagnostics<CR>\n<C-d>\6n\1\0\1\25use_diagnostic_signs\2\nsetup\ftrouble\bmap\nutils\frequire\0", "config", "lsp-trouble.nvim")
time([[Config for lsp-trouble.nvim]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n≈\2\0\0\a\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\v\0005\5\a\0005\6\6\0=\6\b\0055\6\t\0=\6\n\5=\5\f\4=\4\r\0039\4\14\0=\4\15\0039\4\16\0=\4\17\3B\1\2\1K\0\1\0\23other_win_hl_color\feclipse\rfg_color\16picton_blue\17filter_rules\abo\1\0\0\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\2\20include_current\1\19autoselect_one\2\nsetup\18window-picker\vcolors\15highlights\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: tabline.nvim
time([[Config for tabline.nvim]], true)
try_loadstring("\27LJ\2\n\127\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\2\27max_bufferline_percent\3\1\25show_tabline_buffers\3\0\nsetup\ftabline\frequire\0", "config", "tabline.nvim")
time([[Config for tabline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÅ\b\0\0\n\0(\0@6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0026\2\0\0'\4\4\0B\2\2\0026\3\0\0'\5\3\0B\3\2\0029\3\5\0035\5\23\0005\6\6\0005\a\b\0005\b\a\0=\b\t\a5\b\n\0=\b\v\a=\a\f\0065\a\20\0005\b\14\0009\t\r\2=\t\15\b9\t\16\2=\t\17\b9\t\18\2=\t\19\b=\b\21\a=\a\22\6=\6\24\0055\6\26\0005\a\25\0=\a\27\6=\6\28\0055\6\29\0=\6\30\5B\3\2\0019\3\31\1'\5\27\0B\3\2\1\18\3\0\0'\5 \0'\6!\0'\a\"\0B\3\4\1\18\3\0\0'\5 \0'\6\15\0'\a#\0B\3\4\1\18\3\0\0'\5 \0'\6$\0'\a%\0B\3\4\1\18\3\0\0'\5 \0'\6&\0'\a'\0B\3\4\1K\0\1\0-:Telescope current_buffer_fuzzy_find<CR>\n<C-f>(:Telescope lsp_document_symbols<CR>\n<C-s>\29:Telescope live_grep<CR>\30:Telescope find_files<CR>\n<C-p>\6n\19load_extension\25file_ignore_patterns\1\6\0\0\21nodes_modules/.*\f.git/.*\14target/.*\n.yarn\29documentation/index.html\15extensions\bfzf\1\0\0\1\0\3\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\rdefaults\1\0\0\rmappings\6i\1\0\0\n<esc>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\3\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\19preview_cutoff\3x\vheight\4≥ÊÃô\3≥Ê¨ˇ\3\1\0\3\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\18preview_width\4ö≥ÊÃ\tô≥Üˇ\3\20prompt_position\btop\1\0\5\17entry_prefix\6 \20selection_caret\6 \18prompt_prefix\v Ôê¢  \20layout_strategy\15horizontal\21sorting_strategy\14ascending\nsetup\22telescope.actions\14telescope\bmap\nutils\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\nÈ\2\0\0\b\0\14\0\"6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\1\a\0\18\2\0\0'\4\b\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\v\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\v\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1K\0\1\0=vsnip#jumpable(-1) ? \"<Plug>(vsnip-jump-prev)\" : \"<C-h>\"\n<C-h>\6s=vsnip#jumpable(1)  ? \"<Plug>(vsnip-jump-next)\" : \"<C-l>\"\n<C-l>\6i\1\0\2\fnoremap\1\texpr\2\bmap\nutils\frequire $HOME/.config/nvim/snippets\22vsnip_snippet_dir\6g\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'CodeActionMenu', function(cmdargs)
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu' }, _G.packer_plugins)
          return vim.fn.getcompletion('CodeActionMenu ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
