vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim" }
    }

    use 'ntk148v/vim-horizon'
    use 'itchyny/lightline.vim'

	use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use ('nvim-tree/nvim-web-devicons')

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

    use ('nvim-treesitter/playground')
    use ('tpope/vim-commentary')

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
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
