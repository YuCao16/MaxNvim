"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"
"            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  "
"            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  "
"            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  "
"            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  "
"            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  "
"            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  "
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
colorscheme monokai
set mouse=a

"=====================================================
"" Lua Plugin setup
"=====================================================
lua << EOF
require('Comment').setup()
require("scrollbar").setup()
--require("neoclip").setup()
require("neoscroll").setup()
require'nvim-lastplace'.setup{}
require('nvim-autopairs').setup{}
-- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').setup('/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9')
require('spellsitter').setup()
require('cutlass').setup({cut_key="c"})
require('nvim-peekup.config').on_keystroke["delay"] = '100ms'
require('dapui').setup()
-- require('neorg').setup()
require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})
EOF

lua << EOF
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                }
            }
        },
    }
}
EOF

"=====================================================
"" nvim-autopairs settings
"=====================================================
lua << EOF
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
npairs.setup({map_cr=false})

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    return vim.fn["coc#_select_confirm"]()
  else
    return npairs.autopairs_cr()
  end
end
remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
EOF

"=====================================================
"" TrueZen.nvim settings
"=====================================================
lua << EOF
local true_zen = require("true-zen")

true_zen.setup({
modes = {
	ataraxis = {ideal_writing_area_width = {0}}
	}
})
EOF

"=====================================================
"" gitsigns.nvim settings
"=====================================================
lua << EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '+'},
    change       = {hl = 'GitGutterChange', text = '~'},
    delete       = {hl = 'GitGutterDelete', text = '_'},
    topdelete    = {hl = 'GitGutterDelete', text = '‾'},
    changedelete = {hl = 'GitGutterChange', text = '~'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF

"=====================================================
"" register.nvim settings
"=====================================================
let g:registers_window_border = 'single'
let g:peekup_open = '"'

"=====================================================
"" auto-session settings
"=====================================================
" let g:auto_session_root_dir = 'Users/caoyu/.local/share/nvim/session/'
" or use lua
lua << EOF
local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/session/",
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = false,
  auto_session_suppress_dirs = nil,
  -- the configs below are lua only
  -- bypass_session_save_file_types = nil
}

require('auto-session').setup(opts)
EOF

"=====================================================
"" JABS.nvim settings
"=====================================================
lua << EOF
-- (Optional) easy way to get Neovim current size.
local ui = vim.api.nvim_list_uis()[1]

require 'jabs'.setup {
    position = 'corner', -- center, corner
   	width = 50,
   	height = 10,
   	border = 'shadow', -- none, single, double, rounded, solid, shadow, (or an array or chars)

    -- Options for preview window
    preview_position = 'left', -- top, bottom, left, right
    preview = {
        width = 40,
        height = 30,
        border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or chars)
    },

   	-- the options below are ignored when position = 'center'
    col = ui.width,  -- Window appears on the right
    row = ui.height/2, -- Window appears in the vertical middle
}
EOF

"=====================================================
"" nvim-dap settings
"=====================================================
lua << EOF
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
EOF

"=====================================================
"" General settings
"=====================================================
"enable this will make highlight disable after reflesh init.vim
"syntax on					    " syntax highlight
"syntax enable
let g:glow_border = "rounded"
hi Normal guibg=NONE ctermbg=NONE           " let background transparent
hi NonText ctermbg=NONE guibg=NONE          " make background transparent even if there is no text
hi SignColumn ctermbg=NONE guibg=NONE       " column sign background
hi LineNr ctermfg=NONE guibg=NONE           " Column number background
" hi Pmenu ctermbg='#3c3d38' guibg=8
hi Pmenu guibg='#100f11'

" hi NormalFloat guibg='pink'
"hi NormalFloat guibg='#3c3d38'
set pumheight=20
set termguicolors

set scrolloff=10                            " let 10 lines before/after cursor during scroll
set number
set ruler
set hidden

set cursorline                              " shows line under the cursor's line
set nofoldenable				    " code folding

set enc=utf-8	                            " utf-8 by default
set encoding=utf-8
set ignorecase
set t_Co=256

"=====================================================
"" Coc Configurations
"=====================================================
"inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
"let g:coc_snippet_next = '<space>'
"imap <space> <Plug>(coc-snippets-expand)
"let g:coc_snippet_prev = '<S-TAB>'
"imap <space> <Plug>(coc-snippets-expand)
set updatetime=300
imap <C-y> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" inoremap <expr><Cr>  pumvisible() ? "\<C-y>" : "\<Cr>"
" inoremap <expr><space>  pumvisible() ? "\<C-y>" : "\<space>"
let g:coc_snippet_next =  '<tab>'
" coc-prettier format
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"=====================================================
"" PlotGlot settings
"=====================================================
let g:python_highlight_all = 1
let g:indentLine_setColors = 0
let g:python_highlight_file_headers_as_comments = 1
let g:python_slow_sync = 0

"=====================================================
"" LeetCode settings
"=====================================================
let g:leetcode_browser = 'firefox'
let g:leetcode_solution_filetype = 'python3'


"=====================================================
"" Python settings
"=====================================================
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
let g:semshi#filetypes = ['python']

"=====================================================
"" CSV settings
"=====================================================
let g:csv_delim=','

"=====================================================
"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" AirLine settings 
"=====================================================
let g:airline_powerline_fonts = 1
" let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1 
" Uncomment to display buffer tabline above

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_width = 34
let g:lens#animate = 0
let g:lens#disabled_filetypes = ['nerdtree']
"let g:lens#disabled_filetypes = ['nerdtree','tagbar']

"=====================================================
"" TreeSitter settings
"=====================================================
lua << EOF
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg = {
  install_info = {
    url = 'https://github.com/vhyrro/tree-sitter-norg',
    files = {'src/parser.c', 'src/scanner.cc'},
    branch = 'main'
  }
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust"},
    -- additional_vim_regex_highlighting = {'org'},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
	  enable = true
	  },

rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }

}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}
EOF


"=====================================================
"" VimTex settings
"=====================================================
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_method = 'latexmk'

"=====================================================
"" Scrollbar.nvim settings
"=====================================================
augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

"=====================================================
"" Org Mode settings
"=====================================================
let g:table_mode_corner='|'
lua << EOF
-- require("headlines").setup()
require("org-bullets").setup {
    symbols = { "◉", "○", "✸", "✿" }
    -- or a function that receives the defaults and returns a list
  }
EOF

"=====================================================
"" Tex-Conceal.vim settings
"=====================================================
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
let g:tex_flavor = 'latex'

"=====================================================
"" Markdown settings
"=====================================================
"let g:tex_conceal = ""
"let g:vim_markdown_math = 1
let g:vim_markdown_math = 1  " Used as $x^2$, $$x^2$$

"=====================================================
"" Lua Plugin setup
"=====================================================
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeShowHidden=0                                    " Hide hidden file by default
let NERDTreeWinSize=35
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.config/nvim/vim-snippets/snippets'
let g:snipMate = {'snippet_version' : 1}

"=====================================================
"" UltiSnips settings
"=====================================================
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'

"=====================================================
"" AuGroup settings
"=====================================================
augroup asteriskbold
    au!
    " au BufNewFile,BufRead *.tex let g:UltiSnipsExpandTrigger = '<tab>' 
    au BufNewFile,BufRead *.tex let g:UltiSnipsJumpForwardTrigger = '<tab>'
    au BufNewFile,BufRead *.tex let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    
augroup end

"=====================================================
"" Startify settings
"=====================================================
let g:startify_fortune_use_unicode = 1

" Startify + NERDTree on start when no file is specified
autocmd VimEnter *
    \   if !argc()
    \ |   Startify
    \ |   NERDTree
    \ |   wincmd w
    \ | endif


" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

"=====================================================
"" context.vim settings
"=====================================================
let g:context_nvim_no_redraw = 1
let g:context_add_mappings = 0

"=====================================================
"" Animated settings
"=====================================================
nnoremap <S-K> :call animate#window_delta_height(5)<CR>
nnoremap <S-J> :call animate#window_delta_height(-5)<CR>
nnoremap <S-H> :call animate#window_delta_width(5)<CR>
nnoremap <S-L> :call animate#window_delta_width(-5)<CR>
let g:animate#duration = 100.0
"let g:animate#easing_func = 'animate#ease_out_cubic'
"
"=====================================================
"" Limelight settings
"=====================================================
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'gray'

"=====================================================
"" IndentLine settings
"=====================================================
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
let g:indentLine_defaultGroup = 'SpecialKey'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
"let g:indentLine_setColors = 0

"=====================================================
"" Indent-blankline settings
"=====================================================
" this is a Lua function and must be surround by Lua << EOF ... EOF
lua << EOF
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
EOF

"=====================================================
"" EasyAlign settings
"=====================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"=====================================================
"" FZF settings
"=====================================================
" Bat theme for syntax coloring when viewing files in fzf
let $BAT_THEME='base16'

"=====================================================
"" Filetype-Specific Configurations
"=====================================================
" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=4 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType tex setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType journal setlocal shiftwidth=4 tabstop=4 softtabstop=4

"=====================================================
"" Custom Functions
"=====================================================
" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Switch format package for different filetype
function! SwitchFormatter()
    if &filetype == 'tex'
	"nmap <leader>f :Neoformat latexindent<CR>
	:Neoformat latexindent
    else
	"nmap <leader>o  :call CocAction('format')<CR>
	:call CocAction('format')
    endif
endfunction

function! s:goyo_leave()
         hi Normal guibg=NONE ctermbg=NONE
         hi NonText ctermbg=NONE guibg=NONE   
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()

"=====================================================
"" Custom Mappings 
"=====================================================
let mapleader=","
nmap <silent> <leader><leader> :noh<CR>

nmap <leader>p :TagbarToggle<CR>
nmap \| <leader>p
nmap <leader>s :Files<CR>
nmap <leader>q :NERDTreeToggle<CR>
nnoremap <silent> <TAB> :call <SID>show_documentation()<CR>
" nmap <leader>g :Goyo<CR>	
nmap <leader>g :TZAtaraxis<CR>	
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
nmap <leader>t gt<CR>
nmap <leader>b :bn<CR>
nmap <leader>i :so ~/.config/nvim/init.vim<CR>
nmap <leader>hp :Gitsigns preview_hunk<CR>
nmap <leader>w <C-w>
nmap <leader>f :call SwitchFormatter()<CR>
nmap <leader>cf :ToggleTerm direction=float<CR>
nmap <leader>cv :ToggleTerm size=40 direction=vertical<CR>
nmap <leader>ch :ToggleTerm direction=horizontal<CR>
nmap <leader>ct :ToggleTerm direction=tab<CR>
nmap <leader>dc :lua require'dap'.continue()<CR> 
nmap <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nmap <leader>ds :lua require'dap'.step_over()<CR>
nmap <leader>dt :lua require('dap').disconnect(); require('dap.repl').close(); require'dapui'.close()<CR>
nmap <leader>do :lua require'dapui'.toggle()<CR>
nmap <leader><tab> :JABSOpen<CR>
nnoremap <leader>0 :lua require("nabla").popup({ border = 'single' })<CR>
" nmap <leader>t :call TrimWhitespace()<CR>

" Scrolling documentation in insert mode
inoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<down>"
inoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<up>"

" This line map run python with <,2> and close python shell after running
autocmd FileType python map <buffer> <leader>2 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" This line open Startify when new buffer create
"autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif

"=====================================================
"" Automatically settings
"=====================================================
" these three command below fix the issue that coc-vimtex need vimtex loaded
autocmd FileType,BufNewFile,BufFilePre,BufRead *.md set filetype=tex
autocmd FileType,BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd FileType,BufNewFile,BufFilePre,BufRead *.ipynb set filetype=tex

autocmd BufCreate *.ipynb set filetype=tex
autocmd BufCreate *.ipynb set filetype=markdown
"autocmd BufWinEnter *.ipynb :call CocAction('format')
autocmd BufWinEnter echo 1

"autocmd FileType,BufNewFile,BufFilePre,BufRead *.ipynb set filetype=markdown
autocmd FileType python set colorcolumn=80
autocmd FileType python :hi ColorColumn guibg=#ff3131 ctermbg=236
autocmd FileType markdown set textwidth=80

augroup refreshNERDTree
    autocmd!
    autocmd BufEnter NERD_tree_* NERDTreeRefreshRoot
augroup END
