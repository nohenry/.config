vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim" }
    }

	-- use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }
    use 'ntk148v/vim-horizon'
    use 'itchyny/lightline.vim'

	use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use ('nvim-tree/nvim-web-devicons')
    use ('LhKipp/nvim-nu', { run = ":TSInstall nu" })
    use 'm4xshen/autoclose.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    use ('nvim-treesitter/playground')

    use ('tpope/vim-commentary')

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            print ("bruh")
            require("nvim-surround").setup({
                keymaps = {
                    normal = "ms",
                }
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use({
        "Pocco81/auto-save.nvim",
        config = function()
             require("auto-save").setup({
                 debounce_delay = 1000,
             })
        end,
    })

end)
