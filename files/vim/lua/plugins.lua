local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
        install_path)
    execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    -- ?
    use { 'wbthomason/packer.nvim', opt = true }

    use { 'tpope/vim-commentary' }
    use { 'windwp/nvim-autopairs' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-unimpaired' }
    use {
        "junegunn/fzf.vim",
        requires = { { "junegunn/fzf", run = "./install --all" } }
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v1',
        config = function()
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- langs
    use {
        'nvim-tree/nvim-tree.lua',

        requires = {
            'nvim-tree/nvim-web-devicons' -- optional, for file icons
        },
        config = function() require 'nvim-tree'.setup {} end,
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use { 'sheerun/vim-polyglot' }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        config = require("plugins.treesitter")
    }
    use {
        'andymass/vim-matchup',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'p00f/nvim-ts-rainbow',

        requires = { 'nvim-treesitter/nvim-treesitter' }
    }

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' }, -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, { 'hrsh7th/cmp-buffer' }, { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' }, { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' }, -- Snippets
            { 'L3MON4D3/LuaSnip' }, { 'rafamadriz/friendly-snippets' }
        }
    }
    use { "jose-elias-alvarez/null-ls.nvim" }

    use { 'hoob3rt/lualine.nvim', config = require("plugins.lualine") }
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
        requires = { 'nvim-lua/plenary.nvim' },
        config = require("plugins.gitsigns")
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup {} end
    }
    use {
        'phaazon/mind.nvim',
        branch = 'v2.2',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require 'mind'.setup() end
    }

    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { 'windwp/nvim-spectre', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'p00f/alabaster.nvim' }
    use { 'hkupty/iron.nvim' }

end)
