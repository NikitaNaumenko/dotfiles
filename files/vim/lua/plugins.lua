local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  -- ?
  use {'wbthomason/packer.nvim', opt = true}

  use { 'tpope/vim-commentary' }
  use { 'windwp/nvim-autopairs' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-dispatch' }
  use { 'nathanaelkane/vim-indent-guides' }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Navigation
  use { 'easymotion/vim-easymotion' }
  use { "junegunn/fzf.vim",
        requires = {{"junegunn/fzf", run = "./install --all"}}
      }

  -- langs
  use { 'fatih/vim-go' }
  use { 'dracula/vim' }
  use { 'tpope/vim-git' }
  use { 'sheerun/vim-polyglot' }
  use { 'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        config = require("plugins.treesitter")
       }
  use { 'Olical/conjure' }

  -- lsp
  use { "neovim/nvim-lspconfig" }
  use { 'williamboman/nvim-lsp-installer' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = require('plugins.cmp')
  }
  use { "rafamadriz/friendly-snippets" }

  use { 'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = require("plugins.lualine")
  }
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = require("plugins.gitsigns") }
  use { 'nvim-telescope/telescope.nvim',
         requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }}
end)
