local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
    install_path)
  execute 'packadd packer.nvim'
end

execute('packadd packer.nvim')

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  -- ?
  use { 'wbthomason/packer.nvim', opt = true }

  -- Utilities
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-unimpaired' }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { 'windwp/nvim-spectre', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'hkupty/iron.nvim' }
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup({ direction = "float" })
    end
  }

  -- Navigation --
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
  use {
    'nvim-tree/nvim-tree.lua',

    requires = {
      'nvim-tree/nvim-web-devicons' -- optional, for file icons
    },
    config = function() require 'nvim-tree'.setup {} end,
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Colorscheme --
  use { 'Mofiqul/dracula.nvim' }

  -- Treesitter --
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use {
    'andymass/vim-matchup',
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  -- LSP --
  -- use {
  --   'VonHeikemen/lsp-zero.nvim',
  --   requires = {
  --     -- LSP Support
  --     { 'neovim/nvim-lspconfig' }, { 'williamboman/mason.nvim' },
  --     { 'williamboman/mason-lspconfig.nvim' }, -- Autocompletion
  --     { 'hrsh7th/nvim-cmp' }, { 'hrsh7th/cmp-buffer' }, { 'hrsh7th/cmp-path' },
  --     { 'saadparwaiz1/cmp_luasnip' }, { 'hrsh7th/cmp-nvim-lsp' },
  --     { 'hrsh7th/cmp-nvim-lua' }, -- Snippets
  --     { 'L3MON4D3/LuaSnip' },
  --   }
  -- }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'L3MON4D3/LuaSnip' }, -- Required
      { -- Optional
        'williamboman/mason.nvim',
        run = function() pcall(vim.cmd, 'MasonUpdate') end
      }, { 'williamboman/mason-lspconfig.nvim' }, { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' }, { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' }, { 'rafamadriz/friendly-snippets' }
    }
  }

  use { "jose-elias-alvarez/null-ls.nvim" }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end
  }

  -- UI --
  use { 'hoob3rt/lualine.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
  }

  -- Others --
  use { 'mrjones2014/legendary.nvim' }
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim", "jfpedroza/neotest-elixir"

    }
  }
end)
