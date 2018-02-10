call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-commentary'  " for commentary 
Plug 'tpope/vim-endwise'     " for comlete duo symbols
Plug 'tpope/vim-fugitive'    " work with git
Plug 'tpope/vim-git'         " work with git
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'elzr/vim-json'
Plug 'vim-scripts/CSApprox' "Make gvim-only colorschemes work transparently in terminal vim 
Plug 'ryanoasis/vim-devicons'
"colorshemes
" Plug 'chriskempson/base16-vim'
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"Autocomplete
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'easymotion/vim-easymotion'
" Plug 'rakr/vim-one'
" Plug 'liuchengxu/space-vim-dark'
Plug 'nanotech/jellybeans.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"Search and navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'jlanzarotta/bufexplorer'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Other
Plug 'itchyny/lightline.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
""Languages support
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'lmeijvogel/vim-yaml-helper'
" Plug 'kylef/apiblueprint.vim'
" Plug 'tmux-plugins/vim-tmux'

" JavaScript
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'mtscout6/vim-cjsx'
" Plug 'flowtype/vim-flow'
" Plug 'moll/vim-node'
" Plug 'benjie/neomake-local-eslint.vim'
" Plug 'posva/vim-vue'

" Ruby, Rails
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'tpope/vim-rvm'
Plug 'p0deje/vim-ruby-interpolation', { 'for': 'ruby' }
" Plug 'tpope/vim-rake'
call plug#end()

