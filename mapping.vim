"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  "
"            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  "
"            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  "
"            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  "
"            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  "
"            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  "
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"


"=====================================================
"" Coc Configurations
"=====================================================

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
inoremap <expr><Cr>  pumvisible() ? "\<C-y>" : "\<Cr>"
"inoremap <expr><space>  pumvisible() ? "\<C-y>" : "\<space>"
let g:coc_snippet_next =  '<tab>'

"=====================================================
"" Animated settings
"=====================================================
nnoremap <S-K> :call animate#window_delta_height(10)<CR>
nnoremap <S-J> :call animate#window_delta_height(-10)<CR>
nnoremap <S-H> :call animate#window_delta_width(10)<CR>
nnoremap <S-L> :call animate#window_delta_width(-10)<CR>


"=====================================================
"" EasyAlign settings
"=====================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


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



"=====================================================
"" Custom Mappings 
"=====================================================
let mapleader=","

nmap <leader>p :TagbarToggle<CR>
nmap \| <leader>p
nmap <leader>s :Files<CR>
nmap <leader>q :NERDTreeToggle<CR>
nmap <leader>g :Goyo<CR>	
nmap <leader>G :q<CR><leader>q<CR><leader>i<CR><leader>q<CR><C-w><C-w><CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
nmap <leader>t gt<CR>
nmap <leader>b :bn<CR>
nmap <leader>i :so ~/.config/nvim/init.vim<CR>
nmap <leader>hp :Gitsigns preview_hunk<CR>
nmap <leader>w <C-w>
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


