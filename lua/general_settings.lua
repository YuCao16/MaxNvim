--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-- local cmd = vim.cmd     				-- Execute Vim commands
-- local exec = vim.api.nvim_exec 	-- Execute Vimscript
-- local g = vim.g         				-- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

opt.mouse = "a" -- Enable mouse support
opt.updatetime = 50
opt.termguicolors = true
opt.number = true -- Show line number
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.hidden = true -- Enable background buffers
opt.ruler = true
opt.cursorline = true
opt.foldenable = false
opt.incsearch = true
opt.hlsearch = true
vim.o.pumheight = 20
vim.o.scrolloff = 10
-- vim.o.enc = utf-8
-- vim.cmd([[set mouse=a]])
-- vim.cmd([[set termguicolors]])
-- vim.cmd([[set pumheight=20]])
-- vim.cmd([[set scrolloff=10]])
-- vim.cmd([[set number]])
-- vim.cmd([[set ruler]])
-- vim.cmd([[set hidden]])
-- vim.cmd([[set cursorline]])
-- vim.cmd([[set nofoldenable]])
-- vim.cmd([[set foldmethod=indent]])
vim.cmd([[set enc=utf-8]])
-- vim.cmd([[set ignorecase]])
-- vim.cmd([[set smartcase]])
vim.cmd([[set t_Co=256]])
-- vim.cmd([[set incsearch]])
-- vim.cmd([[set hlsearch]])
