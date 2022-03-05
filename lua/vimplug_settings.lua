--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

local g = vim.g -- Global variables
local cmd = vim.cmd -- Execute Vim commands

-- "=====================================================
-- "" Coc Configurations
-- "=====================================================
g["coc_snippet_next"] = "<tab>"

-- "=====================================================
-- "" tagbar settings
-- "=====================================================
-- cmd([[let g:tagbar_width = 50]])
g["tagbar_width"] = 34

-- "=====================================================
-- "" LENS settings
-- "=====================================================
-- cmd([[let g:lens#animate = 0]])
-- cmd([[let g:animate#duration = 100.0]])
--
-- cmd("let g:lens#disabled_filetypes = ['nerdtree','tagbar']")
g["lens#animate"] = 0
g["animate#duration"] = 100.0
g["lens#disabled_filetypes"] = { "nerdtree", "tagbar", "nvimtree" }

-- "=====================================================
-- "" Glow settings
-- "=====================================================
-- cmd([[let g:glow_border = "rounded"]])
g["glow_border"] = "rounded"

-- "=====================================================
-- "" Dashboard settings
-- "=====================================================
g["Hexokinase_highlighters"] = "backgroundfull"

-- "=====================================================
-- "" LeetCode settings
-- "=====================================================
-- cmd([[let g:leetcode_browser = 'firefox']])
-- cmd([[let g:leetcode_solution_filetype = 'python3']])
g["leetcode_browser"] = "firefox"
g["leetcode_solution_filetype"] = "python3"

-- "=====================================================
-- "" Python settings
-- "=====================================================
-- cmd([[let g:syntastic_python_python_exec = 'python3']])
-- cmd([[let g:syntastic_python_checkers = ('python')]])
-- cmd([[let g:semshi#filetypes = ['python']]])
g["syntastic_python_checkers"] = "python"
g["syntastic_python_python_exec"] = "python3"

-- "=====================================================
-- "" CSV settings
-- "=====================================================
-- cmd([[let g:csv_delim=',']])
g["csv_delim"] = ","

-- "=====================================================
-- "" VimTex settings
-- "=====================================================
-- cmd([[let g:vimtex_view_method = 'skim']])
-- cmd([[let g:vimtex_compiler_method = 'latexmk']])
g["vimtex_view_method"] = "skim"
g["vimtex_compiler_method"] = "latexmk"

-- "=====================================================
-- "" vim-table-mode settings
-- "=====================================================
-- cmd([[let g:table_mode_corner='|']])
g["table_mode_corner"] = "|"

-- "=====================================================
-- "" Markdown settings
-- "=====================================================
-- "let g:tex_conceal = ""
-- "let g:vim_markdown_math = 1
-- cmd([[let g:vim_markdown_math = 1]])
-- cmd([[let g:tex_conceal = ""]])
g["vim_markdown_math"] = 1
g["tex_conceal"] = ""

-- "=====================================================
-- "" SnipMate settings
-- "=====================================================
-- cmd([[let g:snippets_dir='~/.config/nvim/snippets/snippets']])
cmd([[let g:snipMate = {'snippet_version' : 1}]])
g["snippets_dir"] = "~/.config/nvim/snippets/snippets"
-- g['snipMate'] = {'snippet_version' :1}

-- "=====================================================
-- "" UltiSnips settings
-- "=====================================================
-- cmd([[let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips']])
g["UltiSnipsSnippetsDir"] = "~/.config/nvim/UltiSnips"

-- "=====================================================
-- "" Startify settings
-- "=====================================================
-- cmd([[let g:startify_fortune_use_unicode = 1]])
-- g['startify_fortune_use_unicode'] = 1
-- g['startify_session_sort'] = 1
-- -- g['startify_center'] = 1
-- -- g['startify_padding_left'] = 30

-- "=====================================================
-- "" Dashboard settings
-- "=====================================================
g["dashboard_default_executive"] = "telescope"
g["dashboard_session_directory"] = "Users/caoyu/.local/share/nvim/session"
cmd([[
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\ '                                                       ',
\ '                                                       ',
\ '                                                       ',
\ '            Don‘t forget why you neovim!               ',
\ '                                                       ',
\]
]])
-- cmd([[
-- let g:dashboard_custom_header =<< trim END
-- =================     ===============     ===============   ========  ========
-- \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
-- ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
-- || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
-- ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
-- || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
-- ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
-- || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
-- ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
-- ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
-- ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
-- ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
-- ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
-- ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
-- ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
-- ||.=='    _-'                                                     `' |  /==.||
-- =='    _-'                        N E O V I M                         \/   `==
-- \   _-'                                                                `-_   /
--  `''                                                                      ``'
-- END
-- ]])

-- "=====================================================
-- "" nvim-tree.lua settings
-- "=====================================================
cmd([[let g:nvim_tree_icons = {'default':''}]])

-- "=====================================================
-- "" FizCursorHold settings
-- "=====================================================
-- cmd([[let g:cursorhold_updatetime = 100]])
g["cursorhold_updatetime"] = 100

-- "=====================================================
-- "" Limelight settings
-- "=====================================================
-- cmd([[let g:limelight_conceal_ctermfg = 'gray']])
-- cmd([[let g:limelight_conceal_guifg = 'gray']])
g["limelight_conceal_ctermfg"] = "gray"
g["limelight_conceal_guifg"] = "gray"

-- "=====================================================
-- "" IndentLine settings
-- "=====================================================
-- cmd([[let g:indentLine_char = '▏']])
-- cmd([[let g:indentLine_defaultGroup = 'NonText']])
-- cmd([[let g:indentLine_defaultGroup = 'SpecialKey']])
--
-- cmd([[let g:vim_json_syntax_conceal = 0]])
-- cmd([[let g:vim_markdown_conceal = 0]])
-- cmd([[let g:vim_markdown_conceal_code_blocks = 0]])
g["indentLine_char"] = "▏"
g["indentLine_defaultGroup"] = "NonText"
g["indentLine_defaultGroup"] = "SpecialKey"

g["vim_json_syntax_conceal"] = 0
g["vim_markdown_concel"] = 0
g["vim_markdown_conceal_code_blocks"] = 0

-- "=====================================================
-- "" register.nvim settings
-- "=====================================================
-- cmd([[let g:registers_window_border = 'single']])
-- cmd([[let g:peekup_open = '"']])
g["registers_window_border"] = "single"
g["peekup_open"] = '"'

-- "=====================================================
-- "" FZF settings
-- "=====================================================
-- cmd([[let $BAT_THEME='base16']])

-- "=====================================================
-- "" Tex-Conceal.vim settings
-- "=====================================================
cmd([[set conceallevel=1]])
g["tex_conceal"] = "abdmg"
g["tex_flavor"] = "latex"
cmd([[hi Conceal ctermbg=none]])
