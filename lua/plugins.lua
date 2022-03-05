--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- "-------------------=== Basic ===-------------
	use({ "neoclide/coc.nvim", branch = "release", event = "BufAdd" })
	use({ "majutsushi/tagbar", ft = { "python", "markdown", "tex", "ipynb", "org" } })
	use { 'sidebar-nvim/sidebar.nvim',
		config = function()
			require("sidebar-nvim").setup({
				sections = {
					"datetime","git","symbols","todos"
				},
				symbols = {
					icon = "ƒ"
				}
			})
		end
	}
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup()
		end,
	})
	-- use({ "mhinz/vim-startify", event = "BufAdd" })
	use({ "mhinz/vim-startify" })
	-- use {
	-- 	'goolord/alpha-nvim',
	-- 	config = function ()
	-- 		require'alpha'.setup(require'alpha.themes.dashboard'.config)
	-- 	end
	-- }
	use({ "glepnir/dashboard-nvim" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})
	use({
		"petertriho/nvim-scrollbar",
		event = "BufAdd",
		config = function()
			require("scrollbar").setup()
		end,
	})
	use({
		"folke/zen-mode.nvim",
		event = "BufAdd",
		config = function()
			require("zen-mode").setup({
				window = {
					width = 0.75, -- width will be 85% of the editor width
				},
			})
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("nvim-tree").setup({
				auto_close = ture,
				show_on_startup = true,
				view = {
					hide_root_folder = false,
				},
				filters = {
					dotfiles = true,
				},
				git = {
					enable = true,
					ignore = true,
				},
				view = {
					width = 40,
				},
				actions = {
					open_file = {
						quit_on_open = false,
						resize_window = false,
					},
				},
			})
		end,
	})

	-- use("romgrk/barbar.nvim")
	-- use { 'startup-nvim/startup.nvim' }
	-- use { 'nvim-neo-tree/neo-tree.nvim',
	-- 	branch = "v1.x",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim"
	--    },
	-- }
	-- use {'ms-jpq/chadtree', branch= 'chad', run = 'python3 -m chadtree deps'}
	-- " use 'scrooloose/NERDTree'		      " File Explorer
	-- " use 'vim-airline/vim-airline'

	-- "-------------------=== Utile ===-------------
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})
	use({ "antoinemadec/FixCursorHold.nvim" })
	use({ "famiu/bufdelete.nvim", event = "BufAdd" })
	use({ "tmhedberg/SimpylFold", event = "BufAdd" })
	-- use("junegunn/fzf")
	-- use("junegunn/fzf.vim") -- " Search Tools
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"Pocco81/TrueZen.nvim",
		event = "BufAdd",
		config = function()
			local true_zen = require("true-zen")

			true_zen.setup({
				modes = {
					ataraxis = {
						ideal_writing_area_width = { 0 },
						custom_bg = { "#1e222a" },
						disable_bg_configuration = false,
					},
				},
			})
		end,
	})
	use({
		"matbme/JABS.nvim",
		event = "BufAdd",
		config = function()
			local ui = vim.api.nvim_list_uis()[1]
			require("jabs").setup({
				position = "corner", -- center, corner
				width = 50,
				height = 10,
				border = "shadow", -- none, single, double, rounded, solid, shadow, (or an array or chars)
				preview_position = "left", -- top, bottom, left, right
				preview = {
					width = 40,
					height = 30,
					border = "double", -- none, single, double, rounded, solid, shadow, (or an array or chars)
				},
				col = ui.width, -- Window appears on the right
				row = ui.height / 2, -- Window appears in the vertical middle
			})
		end,
	})
	use({
		"karb94/neoscroll.nvim",
		event = "BufAdd",
		config = function()
			require("neoscroll").setup()
		end,
	})
	use({ "camspiers/animate.vim" }) -- " window resizer
	use({ "camspiers/lens.vim" })
	use({ "sindrets/winshift.nvim", event = "BufAdd" })
	use({ "junegunn/limelight.vim", event = "BufAdd" })
	use({ "kevinhwang91/nvim-hlslens", event = "BufAdd" })
	use({
		"rmagatti/auto-session",
		config = function()
			local opts = {
				log_level = "info",
				auto_session_enable_last_session = false,
				auto_session_root_dir = vim.fn.stdpath("data") .. "/session/",
				auto_session_enabled = true,
				auto_save_enabled = true,
				auto_restore_enabled = false,
				auto_session_suppress_dirs = nil,
			}

			require("auto-session").setup(opts)
		end,
	})
	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("session_manager").setup({
				autoload_mode = false,
			})
		end,
	})
	use({
		"nvim-neorg/neorg",
		event = "BufAdd",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.norg.concealer"] = {},
					["core.norg.dirman"] = {
						config = {
							workspaces = {
								work = "~/notes/work",
								home = "~/notes/home",
							},
						},
					},
				},
			})
		end,
	})
	use({ "tpope/vim-repeat", event = "BufAdd" })
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({})
		end,
	})
	use({ "rcarriga/nvim-notify" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "RRethy/vim-illuminate", event = "BufAdd" })

	-- " use 'folke/twilight.nvim'

	-- "-------------------=== Code/Project navigation ===-------------
	use({
		"windwp/nvim-autopairs",
		-- event = "BufAdd",
		config = function()
			local remap = vim.api.nvim_set_keymap
			local npairs = require("nvim-autopairs")
			npairs.setup({ map_cr = false })

			-- skip it, if you use another global object
			_G.MUtils = {}

			MUtils.completion_confirm = function()
				if vim.fn.pumvisible() ~= 0 then
					return vim.fn["coc#_select_confirm"]()
				else
					return npairs.autopairs_cr()
				end
			end
			remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
		end,
	})
	use({ "RRethy/nvim-treesitter-endwise" })
	use({
		"romgrk/nvim-treesitter-context",
		-- event = 'BufAdd',
		config = function()
			require("treesitter-context").setup()
		end,
	})
	use({
		"lewis6991/spellsitter.nvim",
		-- event = 'BufAdd',
		config = function()
			require("spellsitter").setup({
				enable = true,
			})
		end,
	})
	use({ "sbdchd/neoformat", event = "BufAdd" }) -- " Format .tex
	use({
		"numToStr/Comment.nvim",
		event = "BufAdd",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "mg979/vim-visual-multi", branch = "master", event = "BufAdd" })
	use({ "junegunn/vim-easy-align", event = "BufAdd" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufAdd",
		config = function()
			vim.opt.termguicolors = true
			vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

			vim.opt.list = true
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup({
				space_char_blankline = " ",
				filetype_exclude = { "dashboard" },
				buftype_exclude = { "terminal" },
				char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
					"IndentBlanklineIndent3",
					"IndentBlanklineIndent4",
					"IndentBlanklineIndent5",
					"IndentBlanklineIndent6",
				},
			})
		end,
	})
	use({ "akinsho/toggleterm.nvim" })
	use({
		"michaelb/sniprun",
		run = "bash install.sh",
		event = "BufAdd",
		config = function()
			require("sniprun").setup({
				display = { "NvimNotify" },
				display_options = {
					notification_timeout = 10, -- timeout for nvim_notify output
				},
			})
		end,
	})
	use({ "weilbith/nvim-code-action-menu" })
	use({ "tpope/vim-surround", event = "BufAdd" })
	use({ "honza/vim-snippets", event = "BufAdd" })

	-- " use 'sirver/ultisnips'
	-- "use 'Yggdroot/indentLine'

	-- "-------------------=== Debugging navigation ===-------------
	use({ "mfussenegger/nvim-dap", event = "BufAdd" })
	use({
		"rcarriga/nvim-dap-ui",
		event = "BufAdd",
		config = function()
			require("dapui").setup()
		end,
	})
	use({
		"Pocco81/DAPInstall.nvim",
		event = "BufAdd",
		config = function()
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
		end,
	})
	use({
		"mfussenegger/nvim-dap-python",
		event = "BufAdd",
		config = function()
			require("dap-python").setup("/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9")
		end,
	})

	-- "-------------------=== Languages support ===-------------------
	use({ "lervag/vimtex", ft = { "markdown", "tex", "ipynb", "org" } }) -- " LaTex
	use({ "KeitaNakamura/tex-conceal.vim", ft = { "markdown", "tex", "ipynb", "org" } })
	use({ "cmhughes/latexindent.pl", ft = { "markdown", "tex", "ipynb", "org" } })
	use({ "jbyuki/nabla.nvim", ft = { "markdown", "tex", "ipynb", "org" } })

	use({ "plasticboy/vim-markdown", ft = { "markdown", "tex", "ipynb" } }) -- " MarkDown
	use({ "godlygeek/tabular", event = "BufAdd" })
	use({ "ellisonleao/glow.nvim", ft = { "markdown" } })
	-- use("vim-pandoc/vim-pandoc")

	use({ "chrisbra/csv.vim", ft = { "csv" } }) -- " CSV

	use({ "nvim-orgmode/orgmode" }) -- " ORG
	use({
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup({
				symbols = { "◉", "○", "✸", "✿" },
			})
		end,
	})
	use({ "lukas-reineke/headlines.nvim" })
	use({ "dhruvasagar/vim-table-mode", event = "BufAdd" })

	use({ "goerz/jupytext.vim", ft = { "markdown", "tex", "ipynb" } })

	-- "-------------------=== Games ===--------------------------
	use({ "ThePrimeagen/vim-be-good", event = "BufAdd" }) --"game
	use({ "ianding1/leetcode.vim", event = "BufAdd" })
	use({ "tjdevries/train.nvim", event = "BufAdd" })
	-- " use 'ThePrimeagen/vim-apm'
	use({
		"gbprod/cutlass.nvim",
		config = function()
			require("cutlass").setup({ cut_key = "c" })
		end,
	})

	-- "-------------------=== Color/Theme ===-------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		-- config = function()
		-- 	local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
		-- 	parser_configs.norg_meta = {
		-- 		install_info = {
		-- 			url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		-- 			files = { "src/parser.c" },
		-- 			branch = "main",
		-- 		},
		-- 	}
		-- 	parser_configs.norg = {
		-- 		install_info = {
		-- 			url = "https://github.com/vhyrro/tree-sitter-norg",
		-- 			files = { "src/parser.c", "src/scanner.cc" },
		-- 			branch = "main",
		-- 		},
		-- 	}
		-- 	parser_configs.norg_table = {
		-- 		install_info = {
		-- 			url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		-- 			files = { "src/parser.c" },
		-- 			branch = "main",
		-- 		},
		-- 	}
		-- end,
	})
	use({ "p00f/nvim-ts-rainbow", event = "BufAdd" })
	use({ "nvim-treesitter/playground", event = "BufAdd" })

	use({ "ryanoasis/vim-devicons", event = "BufAdd" }) -- " Beautiful Icon
	use("kyazdani42/nvim-web-devicons")

	use("projekt0n/github-nvim-theme")
	use({ "ayu-theme/ayu-vim", event = "BufAdd" })
	use({ "arcticicestudio/nord-vim", event = "BufAdd" })
	use({ "joshdick/onedark.vim", event = "BufAdd" })
	use({ "dracula/vim", event = "BufAdd" })
	use({ "sainnhe/sonokai", event = "BufAdd" })
	use({ "sickill/vim-monokai", event = "BufAdd" })
	use({ "yucao16/monokai_transparent", event = "BufAdd" })
	use({ "tomasiser/vim-code-dark", event = "BufAdd" })
	use({ "marko-cerovac/material.nvim", event = "BufAdd" })
	use({ "olimorris/onedarkpro.nvim", event = "BufAdd" })
	use({ "rose-pine/neovim", event = "BufAdd" })
	use({ "sainnhe/everforest" })
	use({ "sainnhe/gruvbox-material", event = "BufAdd" })

	-- "-------------------=== Other ===-------------------------------
	use({ "tami5/sqlite.lua" })
	use({
		"gennaro-tedesco/nvim-peekup",
		config = function()
			require("nvim-peekup.config").on_keystroke["delay"] = "100ms"
		end,
	})

	-- " use 'TaDaa/vimade'                       " Eye Protection

	-- "-------------------=== Unknown ===-------------------------------
	use("machakann/vim-highlightedyank")
	use({ "neovim/nvim-lspconfig", event = "BufAdd" })
	use({ "svermeulen/vimpeccable", event = "BufAdd" })
	use({ "RishabhRD/popfix" })
	use({ "williamboman/nvim-lsp-installer" })
	use({ "MunifTanjim/nui.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "neomake/neomake", event = "BufAdd" })
end)
