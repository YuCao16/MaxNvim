local cmd = vim.cmd -- Execute Vim commands
require("github-theme").setup({
	transparent = false,
	dark_sidebar = false,
})
cmd([[hi! link StatusLine Normal
hi OrgDONE guifg=green
]])
-- cmd([[colorscheme onedark]])

require("gitsigns").setup({
	signs = {
		add = { hl = "GitGutterAdd", text = "+" },
		change = { hl = "GitGutterChange", text = "~" },
		delete = { hl = "GitGutterDelete", text = "_" },
		topdelete = { hl = "GitGutterDelete", text = "‾" },
		changedelete = { hl = "GitGutterChange", text = "~" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "main",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}

-- require('treesitter-context').setup()

-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
--
-- -- These two are optional and provide syntax highlighting
-- -- for Neorg tables and the @document.meta tag
-- parser_configs.norg_meta = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
--         files = { "src/parser.c" },
--         branch = "main"
--     },
-- }
--
-- parser_configs.norg = {
--   install_info = {
--     url = 'https://github.com/vhyrro/tree-sitter-norg',
--     files = {'src/parser.c', 'src/scanner.cc'},
--     branch = 'main'
--   }
-- }
--
-- parser_configs.norg_table = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
--         files = { "src/parser.c" },
--         branch = "main"
--     },
-- }

-- require'nvim-treesitter.configs'.setup {
--   -- One of "all", "maintained" (parsers with maintainers), or a list of languages
--   ensure_installed = "maintained",
--
--   -- Install languages synchronously (only applied to `ensure_installed`)
--   sync_install = false,
--
--   -- List of parsers to ignore installing
--   ignore_install = { "javascript" },
--
--   highlight = {
--     -- `false` will disable the whole extension
--     enable = true,
--
--     -- list of language that will be disabled
--     disable = { "c", "rust", "org"},
--     -- additional_vim_regex_highlighting = {'org'},
--
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
--   },
--     indent = {
-- 	  enable = true
-- 	  },
--
-- 	endwise = {
-- 		enable = true,
-- 		},
--
-- 	playground = {
-- 		enable = true,
-- 		disable = {},
-- 		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
-- 		persist_queries = false, -- Whether the query persists across vim sessions
-- 		keybindings = {
-- 			toggle_query_editor = 'o',
-- 		    toggle_hl_groups = 'i',
-- 			toggle_injected_languages = 't',
-- 		  toggle_anonymous_nodes = 'a',
-- 		  toggle_language_display = 'I',
-- 		  focus_language = 'f',
-- 		  unfocus_language = 'F',
-- 		  update = 'R',
-- 		  goto_node = '<cr>',
-- 		  show_help = '?',
-- 		},
-- 	},
--
-- 	rainbow = {
-- 		enable = true,
-- 		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
--     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
--     max_file_lines = nil, -- Do not enable for files with more than n lines, int
--     -- colors = {}, -- table of hex strings
--     -- termcolors = {} -- table of colour name strings
--   }
--
-- }
