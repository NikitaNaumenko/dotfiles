call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-commentary'  " for commentary 
Plug 'tpope/vim-endwise'     " for comlete duo symbols
Plug 'tpope/vim-fugitive'    " work with git
Plug 'tpope/vim-git'         " work with git
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'

"Autocomplete
Plug 'easymotion/vim-easymotion'
"Search and navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
      \]

"Other
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()" General

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
" Apparence
" colorscheme jellybeans
" colorscheme hybrid
set background=light
colorscheme PaperColor
hi Comment cterm=italic

" set default font
set linespace=2
set visualbell
set t_Co=256
set termguicolors

" let g:ale_sign_warning = '☹'
" let g:ale_sign_error = '✗'

let mapleader="\<Space>" "press ,+s for use easy-motion

"mappings

nmap <silent> <leader><leader> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
"
"NerdTree move map
 map <silent> <C-h> :call WinMove('h')<CR>
 map <silent> <C-j> :call WinMove('j')<CR>
 map <silent> <C-k> :call WinMove('k')<CR>
 map <silent> <C-l> :call WinMove('l')<CR>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

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
filetype plugin indent on

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" " bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" nnoremap \ :Ag<SPACE>

filetype plugin indent on

" Lightline
let g:lightline = {
\ 'colorscheme': 'PaperColor',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

nnoremap <leader>b :Buffers<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>gs :Gstatus<CR>

augroup FileTypeTetect
  autocmd!
  autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
  autocmd BufNewFile,BufRead *.slime setlocal filetype=slim
augroup END

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-c> coc#refresh()


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
