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
  use { 'arcticicestudio/nord-vim' }
  use { 'cohama/lexima.vim' }
  use { 'nathanaelkane/vim-indent-guides' }
  -- use { 'vim-test/vim-test' }


  use { 'easymotion/vim-easymotion' }
  use { 'scrooloose/nerdtree', cmd = 'NERDTreeToggle' }
  use {
        "junegunn/fzf.vim",
        requires = {{"junegunn/fzf", run = "./install --all"}}
    }
  use { 'hashivim/vim-terraform', ft = 'terraform' }
  use { 'ekalinin/Dockerfile.vim', ft = 'Dockerfile' }
  use { 'chr4/nginx.vim' }

  use { 'plasticboy/vim-markdown', ft = 'markdown' }
  use { 'shime/vim-livedown', ft = 'markdown' }

  use { 'tpope/vim-ragtag' }
  use { 'slim-template/vim-slim', ft = { 'slim', 'slime' } }
  use { 'tpope/vim-haml', ft = 'haml' }
  use { 'digitaltoad/vim-pug', ft =  { 'jade', 'pug' } }
  use { 'chemzqm/vim-jsx-improve', ft =  'javascript' }
  -- use { 'nvim-treesitter/nvim-treesitter',
  --       run = ":TSUpdate",
  --       config = require("plugins.treesitter")
  --      }

  use { "neovim/nvim-lspconfig" }
  use { "glepnir/lspsaga.nvim" }

  use {
    'hoob3rt/lualine.nvim',
   requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
end)
