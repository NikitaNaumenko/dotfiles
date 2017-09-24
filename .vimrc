call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"colorshemes
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
"Ruby group
Plug  'tpope/vim-endwise'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
"js group
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'

call plug#end()

set t_Co=256
let g:mapleader=',' "press ,+s for use easy-motion
syntax on
colorscheme gruvbox
set background=dark
set number
set expandtab
set tabstop=2
""set paste
set hlsearch
set incsearch
set synmaxcol=200
set nobackup
set noswapfile
set encoding=utf-8
set fileencoding=utf-8
set langmenu=en_US.UTF-8
set wrap
set ai
set listchars=tab:··
set guioptions-=T
set guioptions-=m
filetype plugin indent on
"mappings

map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
