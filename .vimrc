call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
"colorshemes
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

set t_Co=256
let g:mapleader=','
syntax on
colorscheme gruvbox
set background=dark
set number
set expandtab
set tabstop=2
set paste
set hlsearch
set incsearch

"mappings

map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
