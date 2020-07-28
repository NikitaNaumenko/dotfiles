call plug#begin('~/.vim/plugged')
"############# General #############
Plug 'tpope/vim-commentary'        " Fast comment/uncomment lines (Keys - gcc)
Plug 'tpope/vim-endwise'           " Complete duo symbols (if do etc...)
Plug 'tpope/vim-fugitive'          " Git https://github.com/tpope/vim-fugitive :Git diff | :Git commit | :Git add | :GStatus
Plug 'tpope/vim-git'               " Included are syntax, indent, and filetype plugin files for git, gitconfig etc.
Plug 'tpope/vim-surround'          " Surrounding parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-repeat'            " Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-unimpaired'        " ?????????????????
Plug 'axvr/zepl.vim'               " Run REPL
Plug 'NLKNguyen/papercolor-theme'  " Colorscheme 
Plug 'itchyny/lightline.vim'       " Statusline
Plug 'cohama/lexima.vim'           " Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'nathanaelkane/vim-indent-guides'  " Highlight indent lines
Plug 'luochen1990/rainbow'         " Highlight brackets

" ############# Search and navigation #############
Plug 'easymotion/vim-easymotion'                                   " Fast navigation with <leader>s +letter
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}              " Project Tree TODO: Should change to coc-explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " Search by project 
Plug 'junegunn/fzf.vim'                                            " Search

" ############# DevOps #############
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }    " Highlight and commands for terraform
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }  " Highlight Dockerfile
Plug 'chr4/nginx.vim'                                    " Syntax highlight nginx files

" ############# JSON | Markdown | Yaml #############
Plug 'elzr/vim-json'                                     " Highlighting of keywords vs values, JSON-specific
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }    " Syntax highlighting, matching rules etc. for Markdown
Plug 'shime/vim-livedown', { 'for': 'markdown' }         " Vim Livedown plugin (need livedown from npm)
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }               " Highlight YAML

" ############# Templates #############
Plug 'tpope/vim-ragtag'                                      " Support differnt tags like <%= %>
Plug 'othree/html5.vim'                                      " HTML5 + inline SVG omnicomplete function, indent and syntax
Plug 'slim-template/vim-slim', { 'for': ['slim', 'slime'] }  " slim syntax highlighting for vim
Plug 'tpope/vim-haml', { 'for': 'haml' }                     " haml syntax highlighting for vim

" ############# Javascript && Coffeescript #############
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }  " Syntax and indent plugin for React jsx
Plug 'kchmck/vim-coffee-script'                          " Support Coffeescript (I realy want to delete it, but I use CS)
Plug 'leafgarland/typescript-vim'                        " Syntax file and other settings for TypeScript
Plug 'peitalin/vim-jsx-typescript'                       " Syntax highlighting for JSX in Typescript.

" ############# Elixir #############
Plug 'elixir-editors/vim-elixir'                            " Support elixir
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }   " Erlang indentation and syntax for Vim
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }  " Erlang syntax checking and compiler plugin for Vim
Plug 'mhinz/vim-mix-format'                                 " Formatting elixir files :MixFormat

" ############# Clojure #############
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }       " Support Racket
Plug 'guns/vim-clojure-static'                           " ??????? for clojure
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }  " Syntax highlight for clojure
Plug 'fbeline/kibit-vim'                                 " Static code analyzer for clojure
Plug 'liquidz/vim-iced', {'for': 'clojure'}              " REPL
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}   " LSP for clojure
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'kovisoft/slimv', { 'for': ['clojure', 'scheme', 'racket'] }

" ############# CoC #############
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
      \ 'coc-explorer',
      \ 'coc-git',
      \ 'coc-sql',
      \]
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

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'override' : {
  \         'color07' : ['#000000', '0'],
  \       }
  \     }
  \   }
  \ }

" set default font
set linespace=2
set visualbell
set t_Co=256
set termguicolors

let mapleader="\<Space>" "press ,+s for use easy-motion

let g:indent_guides_start_level = 2
set ts=2 sw=2 et
"mappings
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
" nmap <silent> <leader><leader> :CocCommand explorer --toggle --file-columns=diagnosticError:git:selection:clip:indent:icon:filename;filename;fullpath;size;modified;readonly;created;modified;accessed<CR>

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
nnoremap <leader>aa :Ag<CR>
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

" ############# Coc ################
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


augroup zepl
    autocmd!
    autocmd FileType ruby let b:repl_config = { 'cmd': 'bundle exec rails console' }
    autocmd FileType clojure let b:repl_config = { 'cmd': 'lein repl' }
augroup END

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
nmap <silent> <leader>hu :CocCommand git.chunkUndo<CR>
" ############# Coc ################
"
" ############# Clojure ################
map <leader>E :%Eval<cr>
map <leader>e :Eval<cr>
map <leader>r :Require<cr>
map <leader>R :Require!<cr>

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:iced_enable_default_key_mappings = v:true


let g:indent_guides_enable_on_vim_startup = 1
