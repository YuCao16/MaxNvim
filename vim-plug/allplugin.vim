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
"" Plugin List
"=====================================================

" call plug#begin('~/.config/nvim/autoload/plugged')
call plug#begin('~/.local/share/nvim/autoload/plugged')

    "-------------------=== Basic ===-------------
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'majutsushi/tagbar'
    Plug 'mhinz/vim-startify'
    " Plug 'scrooloose/NERDTree'		      " File Explorer
    " Plug 'vim-airline/vim-airline'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'petertriho/nvim-scrollbar'
    Plug 'kyazdani42/nvim-tree.lua'
    
    " Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    " Plug 'kevinhwang91/rnvimr'
    " Plug 'tamago324/lir.nvim'
    " Plug 'goolord/alpha-nvim'
    " Plug 'akinsho/bufferline.nvim'

    "-------------------=== Utile ===-------------
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'famiu/bufdelete.nvim'
    Plug 'tmhedberg/SimpylFold'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'		      " Search Tools
    Plug 'Pocco81/TrueZen.nvim'
    Plug 'folke/zen-mode.nvim'
    Plug 'matbme/JABS.nvim'
    Plug 'karb94/neoscroll.nvim'
    Plug 'camspiers/animate.vim'        " window resizer
    Plug 'camspiers/lens.vim'
    Plug 'sindrets/winshift.nvim'
    Plug 'junegunn/limelight.vim'
    Plug 'kevinhwang91/nvim-hlslens'
    Plug 'rmagatti/auto-session'
    Plug 'nvim-neorg/neorg'
    Plug 'tpope/vim-repeat'
    Plug 'ethanholz/nvim-lastplace'
	Plug 'rcarriga/nvim-notify'
	Plug 'lewis6991/impatient.nvim'

    " Plug 'junegunn/goyo.vim'
    " Plug 'folke/twilight.nvim'
    " Plug 'wellle/context.vim'

    "-------------------=== Code/Project navigation ===-------------
    Plug 'windwp/nvim-autopairs'
	Plug 'RRethy/nvim-treesitter-endwise'
	Plug 'romgrk/nvim-treesitter-context'
	Plug 'nvim-treesitter/playground'
    Plug 'sbdchd/neoformat'		   " Format .tex
    " Plug 'scrooloose/nerdcommenter'
    Plug 'numToStr/Comment.nvim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    "Plug 'Yggdroot/indentLine'
    Plug 'junegunn/vim-easy-align'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'akinsho/toggleterm.nvim'
    " Plug 'michaelb/sniprun'
    Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
    Plug 'weilbith/nvim-code-action-menu'
    Plug 'tpope/vim-surround'
    Plug 'honza/vim-snippets'                 " snippets repo

    " Plug 'sirver/ultisnips'

    "-------------------=== Debugging navigation ===-------------
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'Pocco81/DAPInstall.nvim'
    Plug 'mfussenegger/nvim-dap-python'

    "-------------------=== Languages support ===-------------------
    Plug 'lervag/vimtex'		      " LaTex
    Plug 'KeitaNakamura/tex-conceal.vim'
    Plug 'cmhughes/latexindent.pl'
    Plug 'jbyuki/nabla.nvim'

    Plug 'plasticboy/vim-markdown'	      " MarkDown
    Plug 'godlygeek/tabular'	
    Plug 'ellisonleao/glow.nvim'
    Plug 'vim-pandoc/vim-pandoc'

    Plug 'chrisbra/csv.vim'		      " CSV
    Plug 'williamboman/nvim-lsp-installer'

    Plug 'nvim-orgmode/orgmode'               " ORG
    Plug 'akinsho/org-bullets.nvim'
    Plug 'lukas-reineke/headlines.nvim'
    Plug 'dhruvasagar/vim-table-mode'
    
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'

    Plug 'goerz/jupytext.vim'

	"-------------------=== Games ===--------------------------
    Plug 'ThePrimeagen/vim-be-good'    "game
    Plug 'ianding1/leetcode.vim'
    Plug 'tjdevries/train.nvim'
    " Plug 'ThePrimeagen/vim-apm'
    Plug 'gbprod/cutlass.nvim'

    "-------------------=== Color/Theme ===-------------------
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ryanoasis/vim-devicons' 	      " Beautiful Icon
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'projekt0n/github-nvim-theme'
    Plug 'ayu-theme/ayu-vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim'
    Plug 'sainnhe/sonokai'
    Plug 'sickill/vim-monokai'
    Plug 'RRethy/vim-illuminate'
    Plug 'lewis6991/spellsitter.nvim'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'tomasiser/vim-code-dark'
    Plug 'marko-cerovac/material.nvim'
    Plug 'yucao16/monokai_transparent'

    "-------------------=== Other ===-------------------------------
    Plug 'tami5/sqlite.lua'
    Plug 'gennaro-tedesco/nvim-peekup'

    " Plug 'TaDaa/vimade'                       " Eye Protection

    "-------------------=== Unknown ===-------------------------------
    Plug 'neomake/neomake'
    Plug 'machakann/vim-highlightedyank'
    Plug 'neovim/nvim-lspconfig'
    Plug 'svermeulen/vimpeccable'
    Plug 'RishabhRD/popfix'

"    Plug 'sheerun/vim-polyglot'
"    Plug 'nvim-lua/completion-nvim'
"    Plug 'hrsh7th/cmp-nvim-lsp'
"    Plug 'hrsh7th/cmp-buffer'
"    Plug 'hrsh7th/cmp-path'
"    Plug 'hrsh7th/cmp-cmdline'
"    Plug 'hrsh7th/nvim-cmp'
call plug#end()
