call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-commentary'  " for commentary 
Plug 'tpope/vim-endwise'     " for comlete duo symbols
Plug 'tpope/vim-fugitive'    " work with git
Plug 'tpope/vim-git'         " work with git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'elzr/vim-json'
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

"Autocomplete
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Search and navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Other
Plug 'itchyny/lightline.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'w0ng/vim-hybrid'
Plug 'w0rp/ale'

""Languages support
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'lmeijvogel/vim-yaml-helper'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'mattn/emmet-vim'

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
Plug 'p0deje/vim-ruby-interpolation', { 'for': 'ruby' }
call plug#end()

