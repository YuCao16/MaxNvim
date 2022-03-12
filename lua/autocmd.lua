--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-- vim.cmd([[
-- autocmd VimEnter *
--     \   if !argc()
--     \ |   Startify
--     \ |   execute 'NvimTreeOpen'
--     \ |   wincmd w
--     \ | endif
-- ]])
vim.cmd([[
autocmd FileType dashboard nnoremap <buffer> q :call Handle_dashboard()<CR>
"autocmd filetype * <buffer> :hi ColorColumn guibg=#ff3131 ctermbg=236
"autocmd FileType * :lua Handle_backgound()
"autocmd FileType dashboard <buffer> :lua Handle_backgound()
"autocmd FileType * if &ft!="dashboard" |:lua Handle_backgound() |endif
autocmd FileType startify :lua require"nvim-tree".toggle(false, true)
hi ColorColumn guibg=#ff3131 ctermbg=236
]])
-- vim.cmd([[autocmd FileType dashboard hi Normal guibg=NONE ctermbg=NONE ]])

-- vim.cmd([[ autocmd VimLeave * SessionSave<CR> ]])
vim.cmd([[
augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
]])
-- vim.cmd([[autocmd FileType dashboard nnoremap <buffer> q :bd<CR>]])
-- vim.cmd([[
-- 	autocmd FileType dashboard if len(getbufinfo({'buflisted':1})) == 0 nnoremap <buffer> q :bd<CR> endif
-- ]])
vim.cmd([[
autocmd FileType html setlocal shiftwidth=2 tabstop=4 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType tex setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4
"autocmd FileType org setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType journal setlocal shiftwidth=4 tabstop=4 softtabstop=4
]])

-- This line map run python with <,2> and close python shell after running
vim.cmd([[
autocmd FileType python map <buffer> <leader>2 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
]])

vim.cmd([[
" autocmd FileType,BufNewFile,BufFilePre,BufRead *.md set filetype=tex
" autocmd FileType,BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd FileType,BufNewFile,BufFilePre,BufRead *.ipynb set filetype=tex

autocmd BufCreate *.ipynb set filetype=tex
autocmd BufCreate *.ipynb set filetype=markdown
autocmd BufWinEnter echo 1

"autocmd FileType,BufNewFile,BufFilePre,BufRead *.ipynb set filetype=markdown
autocmd FileType python set colorcolumn=80
"autocmd FileType python :hi ColorColumn guibg=#ff3131 ctermbg=236
autocmd FileType markdown set textwidth=80
]])
vim.cmd([[autocmd bufenter * if (winnr("$") == 1 && &filetype == "nvimtree") | q | endif]])
