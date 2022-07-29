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
    use {'wbthomason/packer.nvim', opt = true}

    use {'tpope/vim-commentary'}
    use {'windwp/nvim-autopairs'}
    use {'tpope/vim-endwise'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-unimpaired'}
    use {'nathanaelkane/vim-indent-guides'}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }

    use {
        "junegunn/fzf.vim",
        requires = {{"junegunn/fzf", run = "./install --all"}}
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v1',
        config = function()
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
        end
    }

    -- langs
    use {'Mofiqul/dracula.nvim'}
    use {'tpope/vim-git'}
    use {'sheerun/vim-polyglot'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        config = require("plugins.treesitter")
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'windwp/nvim-ts-autotag',
        'andymass/vim-matchup',
        'JoosepAlviste/nvim-ts-context-commentstring',
        requires = {'nvim-treesitter/nvim-treesitter'}
    }

    -- lsp
    use {"neovim/nvim-lspconfig"}
    use {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"}
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = require("plugins.lualine")
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = require("plugins.gitsigns")
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup {} end
    }

    use 'nanotee/sqls.nvim'
    use {"jose-elias-alvarez/null-ls.nvim"}
end)
