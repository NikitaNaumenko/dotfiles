lua require("plugins")
lua require("settings")
lua require("mappings")

" filetype plugin indent on
let g:NERDTreeShowHidden=1

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


let g:iced_enable_default_key_mappings = v:true

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
