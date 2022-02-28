"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  "
"            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  "
"            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  "
"            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  "
"            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  "
"            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  "
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" auto-install vim-plug


if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"=====================================================
"" Plugin settings
"=====================================================
call plug#begin('~/.config/nvim/autoload/plugged')

    "-------------------=== Code/Project navigation ===-------------
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tmhedberg/SimpylFold'
    Plug 'majutsushi/tagbar'
    Plug 'mhinz/vim-startify'
    Plug 'scrooloose/NERDTree'		      " File Explorer
    "Plug 'jiangmiao/auto-pairs'               " Auto pairs for '(' '[' '{'
    Plug 'windwp/nvim-autopairs'
    Plug 'sbdchd/neoformat'		   " the only use is format latex file, other filetype formatted by CocAction('format')
    "Plug 'scrooloose/nerdcommenter'
    Plug 'numToStr/Comment.nvim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    "Plug 'Yggdroot/indentLine'
    Plug 'mhinz/vim-signify'
    Plug 'junegunn/vim-easy-align'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'akinsho/toggleterm.nvim'

    "-------------------=== Snippets support ===--------------------
    "Plug 'garbas/vim-snipmate'                " Snippets manager
    "Plug 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    "Plug 'tomtom/tlib_vim'                    " dependencies #2
    Plug 'honza/vim-snippets'                 " snippets repo
    "Plug 'sirver/ultisnips'

    "-------------------=== Languages support ===-------------------
    Plug 'lervag/vimtex'			      " LaTex
    Plug 'KeitaNakamura/tex-conceal.vim'
    Plug 'cmhughes/latexindent.pl'

    Plug 'plasticboy/vim-markdown'	      " MarkDown
    Plug 'godlygeek/tabular'	
    Plug 'ellisonleao/glow.nvim'
    Plug 'vim-pandoc/vim-pandoc'

    Plug 'chrisbra/csv.vim'		      " CSV

    "-------------------=== Color/Theme ===-------------------
    Plug 'projekt0n/github-nvim-theme'
    Plug 'ayu-theme/ayu-vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim'
    Plug 'sainnhe/sonokai'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'sickill/vim-monokai'
    Plug 'vim-python/python-syntax'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


"-------------------=== Other ===-------------------------------
    "Plug 'TaDaa/vimade'                       " Eye Protection
    Plug 'ryanoasis/vim-devicons' 	      " Beautiful Icon
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'		      " Search Tools
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    "Plug 'psliwka/vim-smoothie'
    Plug 'karb94/neoscroll.nvim'
    Plug 'petertriho/nvim-scrollbar'
    Plug 'kevinhwang91/nvim-hlslens'
    Plug 'AckslD/nvim-neoclip.lua'              " clipboard history
    Plug 'tami5/sqlite.lua'
    Plug 'gennaro-tedesco/nvim-peekup'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
    "Plug 'beauwilliams/focus.nvim'
    Plug 'ThePrimeagen/vim-be-good'    "game
    Plug 'ThePrimeagen/vim-apm'
    Plug 'camspiers/animate.vim'        " window resizer
    Plug 'camspiers/lens.vim'
    "-------------------=== Unknown ===-------------------------------
    Plug 'wellle/context.vim'
    Plug 'neomake/neomake'
    Plug 'machakann/vim-highlightedyank'
    Plug 'neovim/nvim-lspconfig'
    Plug 'svermeulen/vimpeccable'
    Plug 'RishabhRD/popfix'
    Plug 'RishabhRD/nvim-lsputils'



"    Plug 'sheerun/vim-polyglot'
"    Plug 'nvim-lua/completion-nvim'
"    Plug 'hrsh7th/cmp-nvim-lsp'
"    Plug 'hrsh7th/cmp-buffer'
"    Plug 'hrsh7th/cmp-path'
"    Plug 'hrsh7th/cmp-cmdline'
"    Plug 'hrsh7th/nvim-cmp'
call plug#end()

lua << EOF
require('Comment').setup()
require("scrollbar").setup()
require("neoclip").setup()
require("neoscroll").setup()
require('nvim-autopairs').setup{}
EOF
"=====================================================
"" General settings
"=====================================================
"enable this will make highlight disable after reflesh init.vim
"syntax on					    " syntax highlight
"syntax enable
colorscheme monokai

hi Normal guibg=NONE ctermbg=NONE           " let background transparent
hi NonText ctermbg=NONE guibg=NONE          " make background transparent even if there is no text

set pumheight=20
set termguicolors

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set number
set ruler
set hidden

set cursorline                              " shows line under the cursor's line
set nofoldenable				    " code folding

set enc=utf-8	                            " utf-8 by default
set smartcase

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
let g:coc_borderchars = ['─', '│', '─', '│', '┌', '┐', '┘', '└'] 

" coc-prettier format
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> <c-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
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
let g:lens#disabled_filetypes = ['tagbar']

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
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

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
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>w <C-w>
"nmap <leader>f :Neoformat<CR>
"nmap <leader>f  :call CocAction('format')<CR>
nmap <leader>f :call SwitchFormatter()<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <leader>cf :ToggleTerm direction=float<CR>
nmap <leader>cv :ToggleTerm size=40 direction=vertical<CR>
nmap <leader>ch :ToggleTerm direction=horizontal<CR>
nmap <leader>ct :ToggleTerm direction=tab<CR>

" This line map run python with <,2> and close python shell after running
autocmd FileType python map <buffer> <leader>2 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"
autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif

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

