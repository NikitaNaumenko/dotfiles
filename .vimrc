source ~/.vim/plugins.vim

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

" Apparence
let base16colorspace=256
colorscheme space-vim-dark
hi Comment cterm=italic
" set default font
set guifont=DejaVu\ Sans\ Mono\ 10
set linespace=2
set visualbell
" colorscheme one
set t_Co=256
" set background=dark
set termguicolors

" colorscheme one
set background=dark
" ALE
let g:ale_sign_warning = '☹'
let g:ale_sign_error = '✗'
let g:airline#extensions#ale#enabled = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" nmap <silent> <C-K> <Plug>(ale_previous_wrap)
" nmap <silent> <C-J> <Plug>(ale_next_wrap)

let mapleader="\<Space>" "press ,+s for use easy-motion
" let g:ycm_server_python_interpreter = '/usr/bin/python3.6' "comment if ymc omplete natively

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:ariline_section_z = "%{strlen(getline('.'))}"
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
let g:ruby_path = system('rvm current')
let g:ctrlp_working_path_mode = 'ra'
" "mappings
"
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
"
""NerdTree move map
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.

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


" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"  let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'


" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
" endif
" if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
" endif
let g:NERDTreeShowHidden=1


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set fillchars=stl:\ ,stlnc:\ ,vert:│
syntax on
let g:airline_theme = "base16_spacemacs"

"check one time after 4s of inactivity in normal mode
au CursorHold * checktime
filetype plugin indent on

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

let g:ackprg = 'ag --vimgrep'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

let g:ctrlsf_default_root = 'project'
let g:ctrlsf_case_sensitive = 'no'
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
filetype plugin indent on

let g:deoplete#enable_at_startup = 1
" show tags
nmap <F8> :TagbarToggle<CR>

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
      \ 'ruby': ['language_server-ruby'],
      \ }

inoremap jj <Esc>
inoremap <Esc> <Nop>
inoremap <Tab> <Esc>
