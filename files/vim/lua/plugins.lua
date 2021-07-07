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
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-git' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-dispatch' }
  use { 'sainnhe/sonokai' }
  use { "cohama/lexima.vim" }
  use { 'nathanaelkane/vim-indent-guides' }
  -- use { 'vim-test/vim-test' }

  use { 'easymotion/vim-easymotion' }
  use { 'scrooloose/nerdtree', cmd = 'NERDTreeToggle' }
  use { "junegunn/fzf.vim",
        requires = {{"junegunn/fzf", run = "./install --all"}}
      }

  use { 'dracula/vim' }
  use { 'sheerun/vim-polyglot' }
  use { 'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        config = require("plugins.treesitter")
       }

  use { "neovim/nvim-lspconfig" }
  use { "hrsh7th/nvim-compe" }
  -- use { "nvim-lua/completion-nvim" }

  use { 'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = require("plugins.lualine")
  }
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope.nvim',
         requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }}
end)
