"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  "
"            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  "
"            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  "
"            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  "
"            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  "
"            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  "
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
colorscheme monokai
lua << EOF
require('Comment').setup()
require("scrollbar").setup()
--require("neoclip").setup()
require("neoscroll").setup()
require('nvim-autopairs').setup{}
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('spellsitter').setup()
require('cutlass').setup({cut_key="c"})
--require("nnn").setup()
--require("focus").setup()
EOF

lua << EOF
require('gitsigns').setup {
  --signs = {
  --  add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
  --  change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  --  delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  --  topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  --  changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  --},
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


lua << EOF
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {

  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = false
    }}
}
EOF

"let g:rnvimr_draw_border = 1
"let g:rnvimr_border_attr = {'fg':'pink', 'bg': 'pink'}
"let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'

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

lua << EOF
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})
EOF


"=====================================================
"" General settings
"=====================================================
"enable this will make highlight disable after reflesh init.vim
"syntax on					    " syntax highlight
"syntax enable
"colorscheme monokai
"colorscheme ayu
let g:glow_border = "rounded"
hi Normal guibg=NONE ctermbg=NONE           " let background transparent
hi NonText ctermbg=NONE guibg=NONE          " make background transparent even if there is no text
hi SignColumn ctermbg=NONE guibg=NONE       " column sign background
hi LineNr ctermfg=NONE guibg=NONE           " Column number background

"hi NormalFloat guibg='pink'
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
set updatetime=300
imap <C-y> <Plug>(coc-snippets-expand)
"imap <space> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><Cr>  pumvisible() ? "\<C-y>" : "\<Cr>"
"inoremap <expr><space>  pumvisible() ? "\<C-y>" : "\<space>"
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
"" Python settings
"=====================================================
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
let g:semshi#filetypes = ['python']

"=====================================================
"" CSV settings
"=====================================================
let g:csv_delim=','


""" Plugin Configurations

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
let g:lens#disabled_filetypes = ['nerdtree']
"let g:lens#disabled_filetypes = ['nerdtree','tagbar']

"=====================================================
"" TreeSitter settings
"=====================================================
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
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
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

"=====================================================
"" VimTex settings
"=====================================================
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_method = 'latexmk'

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
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

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
nnoremap <S-K> :call animate#window_delta_height(10)<CR>
nnoremap <S-J> :call animate#window_delta_height(-10)<CR>
nnoremap <S-H> :call animate#window_delta_width(10)<CR>
nnoremap <S-L> :call animate#window_delta_width(-10)<CR>
let g:animate#duration = 300.0
"let g:animate#easing_func = 'animate#ease_out_cubic'
"=====================================================
"" Limelight settings
"=====================================================
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'gray'

"=====================================================
"" Signify settings
"=====================================================
"let g:signify_sign_add = '│'
"let g:signify_sign_delete = '│'
"let g:signify_sign_change = '│'
"hi DiffDelete guifg=#ff5555 guibg=none

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
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
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

autocmd! User GoyoLeave nested call <SID>goyo_leave()

" " Clear cmd line message
" function! s:empty_message(timer)
"   if mode() ==# 'n'
"     echon ''
"   endif
" endfunction

" augroup cmd_msg_cls
"     autocmd!
"     autocmd CmdlineLeave :  call timer_start(5000, funcref('s:empty_message'))
" augroup END
"echo g:NERDTree.IsOpen()

"=====================================================
"" Custom Mappings 
"=====================================================
let mapleader=","

nmap <leader>p :TagbarToggle<CR>
nmap \| <leader>p
nmap <leader>s :Files<CR>
" 使用<,s> 起到的作用是输入':Files+Enter
nmap <leader>q :NERDTreeToggle<CR>
nmap <leader>g :Goyo<CR>	
"nmap <leader>G :q<CR><leader>i<CR><C-w><C-w><CR><leader>i<CR>
nmap <leader>G :q<CR><leader>q<CR><leader>i<CR><leader>q<CR><C-w><C-w><CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
nmap <leader>t gt<CR>
nmap <leader>b :bn<CR>
nmap <leader>i :so ~/.config/nvim/init.vim<CR>
"nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>hp :Gitsigns preview_hunk<CR>
nmap <leader>w <C-w>
"nmap <leader>f :Neoformat<CR>
"nmap <leader>f  :call CocAction('format')<CR>
nmap <leader>f :call SwitchFormatter()<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <leader>cf :ToggleTerm direction=float<CR>
nmap <leader>cv :ToggleTerm size=40 direction=vertical<CR>
nmap <leader>ch :ToggleTerm direction=horizontal<CR>
nmap <leader>ct :ToggleTerm direction=tab<CR>
nmap <leader>dc :lua require'dap'.continue()<CR> 
nmap <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nmap <leader>ds :lua require'dap'.step_over()<CR>
nmap <leader><tab> :JABSOpen<CR>

" This line map run python with <,2> and close python shell after running
autocmd FileType python map <buffer> <leader>2 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"
"autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif

" nmap <leader>t :call TrimWhitespace()<CR>
"=====================================================
"" Automatically settings
"=====================================================
" This line open the tagbar for python file automatically
autocmd FileType python TagbarToggle

" these two command below fix the issue that coc-vimtex need vimtex loaded
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

