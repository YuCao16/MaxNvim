--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
vim.cmd([[set encoding=utf-8]])
vim.cmd([[let g:python3_host_prog="/Library/Frameworks/Python.framework/Versions/3.9/bin/python3"]])

require('impatient')
require('plugins')
require('bubbles')
require('mappings')
vim.cmd('source $HOME/.config/nvim/settings.vim')
require('vimplug_settings')
require('general_settings')
require('colorscheme')
require('load_plugins')
require('autocmd')

-- require"nvim-tree".toggle(false, true)
-- source $HOME/.config/nvim/vim-plug/allplugin.vim

