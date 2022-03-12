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
local map = vim.api.nvim_set_keymap
g.mapleader = ","
-- g.maplocalleader = ","
map("n", "<leader><leader>", ":noh<CR>", { noremap = false, silent = true })
map("n", "<leader>p", ":TagbarToggle<CR>", { noremap = false, silent = false })
-- map('n','<leader>p','\|', { noremap = false, silent = false })
-- map("n", "<leader>sf", ":Telescope find_files<CR>", { noremap = false, silent = false })
-- map("n", "<leader>ss", ":Telescope find_files<CR>", { noremap = false, silent = false })
-- map("n", "<leader>sg", ":Telescope live_grep<CR>", { noremap = false, silent = false })
map("n", "<leader>sb", ":Telescope buffers<CR>", { noremap = false, silent = false })
-- map("n", "<leader>sh", ":Telescope help_tags<CR>", { noremap = false, silent = false })
-- map("n", "<leader>so", ":Telescope oldfiles<CR>", { noremap = false, silent = false })
map("n", "<leader>sf", ":Files<CR>", { noremap = false, silent = false })
map("n", "<leader>ss", ":Files<CR>", { noremap = false, silent = false })
map("n", "<leader>sg", ":Rg<CR>", { noremap = false, silent = false })
-- map("n", "<leader>sb", ":Buffers<CR>", { noremap = false, silent = false })
map("n", "<leader>sh", ":Helptags<CR>", { noremap = false, silent = false })
map("n", "<leader>so", ":History<CR>", { noremap = false, silent = false })
map("n", "<leader>sl", ":SessionManager load_last_session<CR>", { noremap = false, silent = false })
-- map("n", "<leader>q", ":NvimTreeToggle<CR>", { noremap = false, silent = false })
map("n", "<leader>q", ":lua Handle_nvimtree()<CR>", { noremap = false, silent = false })
map("n", "<leader>Q", ":NvimTreeClose<CR>", { noremap = false, silent = false })
map("n", "<leader>a", ":SidebarNvimToggle<CR>", { noremap = false, silent = false })
map("n", "<TAB>", ":call Show_documentation()<CR>", { noremap = ture, silent = false })
map("n", "<leader>g", ":ZenMode<CR>", { noremap = true, silent = false })
map("n", "<leader>l", ":Limelight!!<CR>", { noremap = false, silent = false })
map("n", "<leader>t", "gt<CR>", { noremap = false, silent = false })
map("n", "<leader>b", ":BufferLineCycleNext<CR>", { noremap = false, silent = false })
map("n", "<leader>B", ":BufferLineCyclePrev<CR>", { noremap = false, silent = false })
map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { noremap = false, silent = false })
map("n", "<leader>w", "<C-w>", { noremap = false, silent = false })
map("n", "<leader>f", ":call SwitchFormatter()<CR>", { noremap = true, silent = false })
map("n", "<leader>cf", ":ToggleTerm direction=float<CR>", { noremap = false, silent = false })
map("n", "<leader>cv", ":ToggleTerm size=40 direction=vertical<CR>", { noremap = false, silent = false })
map("n", "<leader>ch", ":ToggleTerm direction=horizontal<CR>", { noremap = false, silent = false })
map("n", "<leader>ct", ":ToggleTerm direction=tab<CR>", { noremap = false, silent = false })
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { noremap = false, silent = false })
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = false, silent = false })
map("n", "<leader>ds", ":lua require'dap'.step_over()<CR>", { noremap = false, silent = false })
map(
	"n",
	"<leader>dt",
	":lua require('dap').disconnect(); require('dap.repl').close(); require'dapui'.close()<CR>",
	{ noremap = false, silent = false }
)
map("n", "<leader>do", ":lua require'dapui'.toggle()<CR>", { noremap = false, silent = false })
-- map("n", "<leader><tab>", ":JABSOpen<CR>", { noremap = false, silent = false })
map("n", "<leader><tab>", ":lua require('nvim-window').pick()<CR>", { noremap = false, silent = false })
map("n", "<leader>0", ":lua require('nabla').popup({ border = 'single' })<CR>", { noremap = true, silent = false })
map("n", "ga", "<Plug>(EasyAlign)", { noremap = false })
map("n", "<S-K>", ":call animate#window_delta_height(5)<CR>", { noremap = true })
map("n", "<S-J>", ":call animate#window_delta_height(-5)<CR>", { noremap = true })
map("n", "<S-H>", ":call animate#window_delta_width(-5)<CR>", { noremap = true })
map("n", "<S-L>", ":call animate#window_delta_width(5)<CR>", { noremap = true })
map("x", "<leader>l", ":Limelight!!<CR>", { noremap = false, silent = false })
map("x", "ga", "<Plug>(EasyAlign)", {})
map("i", "<C-y>", "<Plug>(coc-snippets-expand)", {})
cmd([[inoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<down>"]])
cmd([[inoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<up>"]])

-- nmap <leader>i :so ~/.config/nvim/settings.vim<CR>

-- "=====================================================
-- "" Custom Mappings
-- "=====================================================
-- " let mapleader=","
-- " nmap <silent> <leader><leader> :noh<CR>
-- "
-- " nmap <leader>p :TagbarToggle<CR>
-- " nmap \| <leader>p
-- " nmap <leader>s :Files<CR>
-- " " nmap <leader>q :NERDTreeToggle<CR>
-- " nmap <leader>q :NvimTreeToggle<CR>
-- " " nnoremap <silent> <TAB> :call <SID>show_documentation()<CR>
-- " nnoremap <TAB> :call <SID>show_documentation()<CR>
-- " nnoremap <leader>g :ZenMode<CR>
-- " nmap <leader>l :Limelight!!<CR>
-- " xmap <leader>l :Limelight!!<CR>
-- " nmap <leader>t gt<CR>
-- " " nmap <leader>b :bn<CR>
-- " nmap <leader>b :BufferNext<CR>
-- " nmap <leader>B :BufferPrevious<CR>
-- " " nmap <leader>i :so ~/.config/nvim/init.vim<CR>
-- " nmap <leader>i :so ~/.config/nvim/settings.vim<CR>
-- " nmap <leader>hp :Gitsigns preview_hunk<CR>
-- " nmap <leader>w <C-w>
-- " nmap <leader>f :call SwitchFormatter()<CR>
-- " nmap <leader>cf :ToggleTerm direction=float<CR>
-- " nmap <leader>cv :ToggleTerm size=40 direction=vertical<CR>
-- " nmap <leader>ch :ToggleTerm direction=horizontal<CR>
-- " nmap <leader>ct :ToggleTerm direction=tab<CR>
-- " nmap <leader>dc :lua require'dap'.continue()<CR>
-- " nmap <leader>db :lua require'dap'.toggle_breakpoint()<CR>
-- " nmap <leader>ds :lua require'dap'.step_over()<CR>
-- " nmap <leader>dt :lua require('dap').disconnect(); require('dap.repl').close(); require'dapui'.close()<CR>
-- " nmap <leader>do :lua require'dapui'.toggle()<CR>
-- " nmap <leader><tab> :JABSOpen<CR>
-- " nnoremap <leader>0 :lua require("nabla").popup({ border = 'single' })<CR>
-- " " nmap <leader>t :call TrimWhitespace()<CR>
-- "
-- " " Scrolling documentation in insert mode
-- " inoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<down>"
-- " inoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<up>"
