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
				visible = false,
				follow_current_file = true,
				use_libuv_file_watcher = true,
				always_show = {
					".clang_format",
					".clang-tidy",
				},
				never_show_by_pattern = { "*.o" },
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
							-- ["<esc>"] = actions.close,
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
				add = { text = "GitSignsAddNr" },
				change = { text = "GitSignsChangeNr" },
				delete = { text = "GitSignsDeleteNr" },
				topdelete = { text = "GitSignsDeleteNr" },
				changedelete = { text = "GitSignsChangeNr" },
				-- add = { text = "┃" },
				-- change = { text = "┃" },
				-- delete = { text = "_" },
				-- topdelete = { text = "‾" },
				-- changedelete = { text = "~" },
				-- untracked = { text = "┆" },
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
	-- { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

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

	{
    'michaelrommel/nvim-silicon',
    lazy = true,
    cmd = 'Silicon',
    opts = {
      font = '{{@@ font @@}}',
      theme = 'Visual Studio Dark+',
      pad_horiz = 0,
      pad_vert = 0,
      no_window_controls = true,
      tab_width = 2,
      to_clipboard = true,
    },
  },
	{ "junegunn/vim-easy-align" },
	{ "wesQ3/vim-windowswap" },

	{
		"ntpeters/vim-better-whitespace",
		event = "BufReadPre",
		keys = {
			{ "<leader><Space>", "<cmd>StripWhitespace<CR>" },
		},
	},

}
