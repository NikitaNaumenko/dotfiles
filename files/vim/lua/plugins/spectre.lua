local spectre = require("spectre")
spectre.setup()

vim.keymap.set('n', '<leader>of', function() spectre.open_file_search() end, {})
vim.keymap.set('n', '<leader>o', function() spectre.open() end, {})
vim.keymap.set('n', '<leader>ov', function() spectre.open() end, {})

-- "search current word
-- nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
-- vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
-- "  search in current file
-- nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
--
--
