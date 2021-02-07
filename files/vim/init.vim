
call plug#begin('~/.vim/plugged')
"############# General #############
Plug 'tpope/vim-commentary'        " Fast comment/uncomment lines (Keys - gcc)
Plug 'tpope/vim-endwise'           " Complete duo symbols (if do etc...)
Plug 'tpope/vim-fugitive'          " Git https://github.com/tpope/vim-fugitive :Git diff | :Git commit | :Git add | :GStatus
Plug 'tpope/vim-git'               " Included are syntax, indent, and filetype plugin files for git, gitconfig etc.
Plug 'tpope/vim-surround'          " Surrounding parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-repeat'            " Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-unimpaired'        " ?????????????????
Plug 'tpope/vim-dispatch'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'       " Statusline
Plug 'cohama/lexima.vim'           " Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'nathanaelkane/vim-indent-guides'  " Highlight indent lines
" Plug 'luochen1990/rainbow'         " Highlight brackets
" Plug 'p00f/nvim-ts-rainbow'
Plug 'vim-test/vim-test'

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
Plug 'mattn/emmet-vim'                                       " Write fast html tags
Plug 'slim-template/vim-slim', { 'for': ['slim', 'slime'] }  " slim syntax highlighting for vim
Plug 'tpope/vim-haml', { 'for': 'haml' }                     " haml syntax highlighting for vim
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }

" ############# Javascript && Coffeescript #############
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }  " Syntax and indent plugin for React jsx
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

" ############# Golang #############
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
      \ 'coc-go',
      \ 'coc-grammarly',
      \]

" ############# LUA PLUGINS #############
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

lua require("settings")
let g:indent_guides_start_level = 2
"mappings
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
"  
" nmap <silent> <leader><leader> :CocCommand explorer<CR>

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
\ 'colorscheme': 'nord',
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

" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:iced_enable_default_key_mappings = v:true

let g:indent_guides_enable_on_vim_startup = 1

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" let test#strategy = "neovim"
let test#neovim#term_position = "vert botright"
" let test#strategy = "dispatch"
let test#strategy = {
  \ 'nearest': 'neovim', 
  \ 'file': 'dispatch',
  \ 'suite': 'dispatch',
  \ 'visit': 'dispatch',
  \}
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
let test#ruby#rspec#executable = "bin/rspec"


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  }
}
EOF

" hi rainbowcol1 guifg=#123456
