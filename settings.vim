"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"
"            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  "
"            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  "
"            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  "
"            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  "
"            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  "
"            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  "
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" let g:nvim_tree_icons = {'default':''}
"=====================================================
"" Coc Configurations
"=====================================================
" imap <C-y> <Plug>(coc-snippets-expand)
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
" let g:coc_snippet_next =  '<tab>'
" coc-prettier format
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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
    if &filetype == 'python'
	:call CocAction('format')
	elseif &filetype == 'markdown'
	:call CocAction('format')
    else
	:Neoformat
    endif
endfunction
" function! SwitchFormatter()
"     if &filetype == 'tex'
" 	:Neoformat latexindent
"     else
" 	:call CocAction('format')
"     endif
" endfunction

function! Transparent_bg()
	if g:colors_name == 'github_dark'
		:lua require('github-theme').setup({transparent=true})
		" hi BufferInactive guifg='#24EA53'
	else
		hi Normal guibg=NONE ctermbg=NONE           " let background transparent
		hi NonText ctermbg=NONE guibg=NONE          " make background transparent even if there is no text
		hi SignColumn ctermbg=NONE guibg=NONE       " column sign background
		hi LineNr ctermfg=NONE guibg=NONE           " Column number background
		hi Pmenu guibg='#100f11'
	endif
	" :call bufferline#highlight#setup()
endfunction

lua << EOF
function Handle_nvimtree()
	if require'nvim-tree.view'.is_visible() then
		if vim.bo.filetype == "NvimTree" then
			require'nvim-tree'.toggle()
		else
			require'nvim-tree'.focus()
		end
	else
		require'nvim-tree'.open()
	end
end
EOF

lua << EOF
function Handle_backgound()
	if vim.bo.filetype == "dashboard" then
		-- require'github-theme'.setup({transparent=true})
		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		-- vim.cmd("hi NonText ctermbg=NONE guibg=NONE")
	else
		-- vim.cmd([[hi Normal guibg='pink' ctermbg='pink' ]])
		vim.cmd("colorscheme everforest")
		vim.cmd("colorscheme github_dark")
	end
end
EOF

function! Handle_dashboard()
	if len(getbufinfo({'buflisted':1}))==0
	:q
	else
	:bd
	endif
endfunction

function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

