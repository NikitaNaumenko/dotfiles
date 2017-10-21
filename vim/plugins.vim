call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'tomtom/tcomment_vim'
"Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/tComment'
Plug 'elzr/vim-json'
"colorsheme
"colorshemes
"Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
"Autocomplete
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'

"Search and navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'dyng/ctrlsf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jasoncodes/ctrlp-modified.vim'

"Other
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vim-syntastic/syntastic'

""Languages support
Plug 'chase/vim-ansible-yaml'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'kylef/apiblueprint.vim'
Plug 'tmux-plugins/vim-tmux'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
"Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh'  }
Plug 'slashmili/alchemist.vim'
Plug 'c-brenn/phoenix.vim'
"
"" " Erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'


" " JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mtscout6/vim-cjsx'
Plug 'flowtype/vim-flow'
Plug 'moll/vim-node'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'posva/vim-vue'
" Ruby, Rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'sunaku/vim-ruby-minitest'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rvm'
Plug 'p0deje/vim-ruby-interpolation'
Plug 'tpope/vim-rake'
call plug#end()

