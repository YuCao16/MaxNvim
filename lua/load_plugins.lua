--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-- require("impatient")
-- require('session_manager').setup({
-- 	autoload_mode = false
-- })
-- require("Comment").setup()
-- require("nvim-web-devicons").set_default_icon("", "#6d8086")
-- require("lualine").setup()
-- require("zen-mode").setup({
-- 	window = {
-- 		width = 0.75, -- width will be 85% of the editor width
-- 	},
-- })
-- require("scrollbar").setup()
-- require("bufferline").setup()
-- require('startup').setup()
-- require("neoscroll").setup()
-- require("nvim-lastplace").setup({})
-- require("nvim-autopairs").setup({})
-- require("dap-python").setup("/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9")
-- require("spellsitter").setup({
-- 	enable = true,
-- })
-- require("cutlass").setup({ cut_key = "c" })
-- require("nvim-peekup.config").on_keystroke["delay"] = "100ms"
-- require("dapui").setup()
-- require('neo-tree').setup()
-- require("nvim-tree").setup({
-- 	auto_close = ture,
-- 	show_on_startup = true,
-- 	view = {
-- 		hide_root_folder = false,
-- 	},
-- 	filters = {
-- 		dotfiles = true,
-- 	},
-- 	git = {
-- 		enable = true,
-- 		ignore = true,
-- 	},
-- 	view = {
-- 		width = 40,
-- 	},
-- 	actions = {
-- 		open_file = {
-- 			quit_on_open = false,
-- 			resize_window = false,
-- 		},
-- 	},
-- })

-- require("neorg").setup({
-- 	load = {
-- 		["core.defaults"] = {},
-- 		["core.norg.concealer"] = {},
-- 		["core.norg.dirman"] = {
-- 			config = {
-- 				workspaces = {
-- 					work = "~/notes/work",
-- 					home = "~/notes/home",
-- 				},
-- 			},
-- 		},
-- 	},
-- })

--=====================================================
-- nvim-autopairs settings
--=====================================================
-- local remap = vim.api.nvim_set_keymap
-- local npairs = require("nvim-autopairs")
-- npairs.setup({ map_cr = false })
--
-- -- skip it, if you use another global object
-- _G.MUtils = {}
--
-- MUtils.completion_confirm = function()
-- 	if vim.fn.pumvisible() ~= 0 then
-- 		return vim.fn["coc#_select_confirm"]()
-- 	else
-- 		return npairs.autopairs_cr()
-- 	end
-- end
-- remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
--=====================================================
-- TrueZen.nvim settings
--=====================================================
-- local true_zen = require("true-zen")
--
-- true_zen.setup({
-- 	modes = {
-- 		ataraxis = {
-- 			ideal_writing_area_width = { 0 },
-- 			custom_bg = { "#1e222a" },
-- 			disable_bg_configuration = false,
-- 		},
-- 	},
-- })
--=====================================================
-- auto-session settings
--=====================================================
-- local opts = {
-- 	log_level = "info",
-- 	auto_session_enable_last_session = false,
-- 	auto_session_root_dir = vim.fn.stdpath("data") .. "/session/",
-- 	auto_session_enabled = true,
-- 	auto_save_enabled = true,
-- 	auto_restore_enabled = false,
-- 	auto_session_suppress_dirs = nil,
-- 	-- the configs below are lua only
-- 	-- bypass_session_save_file_types = nil
-- }
--
-- require("auto-session").setup(opts)

--=====================================================
-- JABS.nvim settings
--=====================================================
-- (Optional) easy way to get Neovim current size.
-- local ui = vim.api.nvim_list_uis()[1]
--
-- require("jabs").setup({
-- 	position = "corner", -- center, corner
-- 	width = 50,
-- 	height = 10,
-- 	border = "shadow", -- none, single, double, rounded, solid, shadow, (or an array or chars)
--
-- 	-- Options for preview window
-- 	preview_position = "left", -- top, bottom, left, right
-- 	preview = {
-- 		width = 40,
-- 		height = 30,
-- 		border = "double", -- none, single, double, rounded, solid, shadow, (or an array or chars)
-- 	},
--
-- 	-- the options below are ignored when position = 'center'
-- 	col = ui.width, -- Window appears on the right
-- 	row = ui.height / 2, -- Window appears in the vertical middle
-- })
--=====================================================
-- nvim-dap settings
--=====================================================
-- local dap_install = require("dap-install")
--
-- dap_install.setup({
-- 	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
-- })
--
-- local dap, dapui = require("dap"), require("dapui")
-- dap.listeners.after.event_initialized["dapui_config"] = function()
-- 	dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end
--=====================================================
-- Org Mode settings
--=====================================================
require("orgmode").setup_ts_grammar()

require("nvim-treesitter.configs").setup({
	-- ensure_installed = "maintained",
	ensure_installed = {'org','python'},
	sync_install = false,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
		disable = { "c", "rust", "org" },
		additional_vim_regex_highlighting = false,
		-- additional_vim_regex_highlighting = { "org" },
	},
	indent = {
		enable = true,
	},
	endwise = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})

require("orgmode").setup({
	org_highlight_latex_and_related = "native",
})
-- local action_set = require('telescope.actions.set')

-- require("orgmode").setup({
-- 	org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
-- 	org_default_notes_file = "~/Dropbox/org/refile.org",
-- })
-- require("headlines").setup()
-- require("org-bullets").setup({
-- 	symbols = { "◉", "○", "✸", "✿" },
-- 	-- or a function that receives the defaults and returns a list
-- })
--=====================================================
-- Sniprun settings
--=====================================================
-- require("sniprun").setup({
-- 	display = { "NvimNotify" },
-- 	display_options = {
-- 		notification_timeout = 10, -- timeout for nvim_notify output
-- 	},
-- })

--=====================================================
-- Indent-blankline settings
--=====================================================
-- vim.opt.termguicolors = true
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
--
-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

-- require("indent_blankline").setup({
-- 	space_char_blankline = " ",
-- 	filetype_exclude = { "dashboard" },
-- 	buftype_exclude = {"terminal"},
-- 	char_highlight_list = {
-- 		"IndentBlanklineIndent1",
-- 		"IndentBlanklineIndent2",
-- 		"IndentBlanklineIndent3",
-- 		"IndentBlanklineIndent4",
-- 		"IndentBlanklineIndent5",
-- 		"IndentBlanklineIndent6",
-- 	},
-- })
