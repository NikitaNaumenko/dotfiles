call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'

" Search and navigation
Plug 'dyng/ctrlsf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'scrooloose/nerdtree'

"Autocomplete
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

"Other
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'kassio/neoterm'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'

"Languages support
Plug 'chase/vim-ansible-yaml'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'kylef/apiblueprint.vim'
Plug 'tmux-plugins/vim-tmux'

" Elixir
"Plug 'elixir-lang/vim-elixir'
"Plug 'thinca/vim-ref'
"Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
"Plug 'slashmili/alchemist.vim'
"Plug 'c-brenn/phoenix.vim'

" " Erlang
" " Plug 'vim-erlang/vim-erlang-runtime'
" Plug 'vim-erlang/vim-erlang-compiler'
" Plug 'vim-erlang/vim-erlang-omnicomplete'
" Plug 'vim-erlang/vim-erlang-tags'


" JavaScript
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
"Plug 'mtscout6/vim-cjsx'
"Plug 'flowtype/vim-flow'
Plug 'moll/vim-node'
Plug 'benjie/neomake-local-eslint.vim'

" Ruby, Rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'sunaku/vim-ruby-minitest'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rvm'
Plug 'p0deje/vim-ruby-interpolation'
call plug#end()
