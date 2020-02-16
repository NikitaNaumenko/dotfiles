" Autoinstall vim-plug
" if empty(glob('~/.nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall
" endif

call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-commentary'  " for commentary 
Plug 'tpope/vim-endwise'     " for comlete duo symbols
Plug 'tpope/vim-fugitive'    " work with git
Plug 'tpope/vim-git'         " work with git
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'

"Search and navigation
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-sh',
      \ 'coc-css',
      \ 'coc-stylelint',
      \ 'coc-elixir',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-jest',
      \ 'coc-solargraph',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-docker',
      \ 'coc-diagnostic',
      \ 'coc-explorer',
      \]
" CocCommand explorer --toggle --file-columns=diagnosticError:git:selection:clip:indent:icon:filename;filename;fullpath;size;modified;readonly;created;modified;accessed


"Other
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'cohama/lexima.vim'

Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim', { 'for': ['slim', 'slime'] }
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'c-brenn/phoenix.vim', { 'for': 'elixir' }
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
Plug 'tpope/vim-ragtag'
Plug 'elzr/vim-json'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'tpope/vim-haml', { 'for': 'haml' }

Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'p0deje/vim-ruby-interpolation', { 'for': 'ruby' }
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'kovisoft/slimv', { 'for': ['clojure', 'scheme', 'racket'] }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'chr4/nginx.vim'
Plug 'luochen1990/rainbow'
call plug#end()
" General

set nocompatible          " Vim behavior, not Vi
scriptencoding utf-8      " Use UTF-8 encoding
set encoding=utf8
set fileencoding=utf-8    " Use UTF-8 encoding
set langmenu=en_US.UTF-8  " Use UTF-8 encoding
set encoding=utf-8        " Use UTF-8 encoding
set nobackup              " Don't backup
set nowritebackup         " Write file inplace
set noswapfile            " Don't use swap files
set autoread              " Autoreload buffers
set autowrite             "  Automatically save changes before switching buffers
syntax enable             " Enable syntax highlight
syntax on                 " Syntax on for wimwiki

" History, Cursor, rules
set history=50                                                                 " Just remeber last 50 commands
set laststatus=2                                                               " Always display status line
set ruler                                                                      " Show the cursor position all the time
set number                                                                     " Show line numbers
set showcmd                                                                    " Display incomplete commands
set cursorline                                                                 " Highlight current cursor line
set shell=$SHELL                                                               " Default shell is ZSH
set statusline=%<%f\ %h%m%r%=\ %{devnotes#statusline()}\ %-14.(%l,%c%V%)\ %P   " Status line format

" Tabs and whitespace
set wrap                                    " Wrap lines
set tabstop=2                               " Tabs are always 2 spaces
set expandtab                               " Expand tabs into spaces
set shiftwidth=2                            " Reindent with 2 spaces (using <<)
set list                                    " Show invisible chars
set listchars=""                            " Reset listchars
set list listchars=tab:»·,trail:·,space:·  " Set listchars for tabs and trailing spaces
set showbreak=↪\                            " Set breakline char

" Search
set hlsearch    " Highlight matches
set incsearch   " Incremental searching
set ignorecase  " Searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set noshowmode  " Doesnt show vim mode
set background=light
colorscheme PaperColor

" set default font
set linespace=2
set visualbell
set t_Co=256
set termguicolors

let mapleader="\<Space>" "press ,+s for use easy-motion

let g:indent_guides_start_level = 2
set ts=2 sw=2 et
"mappings
" nmap <silent> <leader><leader> :NERDTreeToggle<CR>
nmap <silent> <leader><leader> :CocCommand explorer --toggle --file-columns=diagnosticError:git:selection:clip:indent:icon:filename;filename;fullpath;size;modified;readonly;created;modified;accessed<CR>

map <Leader> <Plug>(easymotion-prefix)
"
"NerdTree move map
 map <silent> <C-h> :call WinMove('h')<CR>
 map <silent> <C-j> :call WinMove('j')<CR>
 map <silent> <C-k> :call WinMove('k')<CR>
 map <silent> <C-l> :call WinMove('l')<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
        wincmd v
      else
        wincmd s
      endif
   exec "wincmd ".a:key
  endif
endfunction

let g:NERDTreeShowHidden=1

set fillchars=stl:\ ,stlnc:\ ,vert:│
syntax on

"check one time after 4s of inactivity in normal mode
au CursorHold * checktime

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

filetype plugin indent on

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" Lightline
let g:lightline = {
\ 'colorscheme': 'PaperColor',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly'], ['cocstatus'], ['currentfunction']]
\ },
\ 'component_function': {
\   'cocstatus': 'StatusDiagnostic',
\   'currentfunction': 'CocCurrentFunction'
\ },
\ }

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

" FZF {
nnoremap <leader>b :Buffers<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>gs :Gstatus<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

command! -bang -nargs=? -complete=dir GFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }

augroup FileTypeTetect
  autocmd!
  autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
  autocmd BufNewFile,BufRead *.slime setlocal filetype=slim
augroup END

" Coc
set cmdheight=2
set updatetime=100        " You will have bad experience for diagnostic messages when it's default 4000. coc.nvim
set shortmess+=c

let g:vista_default_executive = 'coc'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-c> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
