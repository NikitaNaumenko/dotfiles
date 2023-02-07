vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {silent = true})
-- Close the current buffer and move to the previous one
vim.api.nvim_set_keymap('n', '<leader>bq', ':bp <BAR> bd #<CR>', {})
vim.api.nvim_set_keymap('n', '<leader><tab>', '<plug>(fzf-maps-n)', {})
-- Insert mode competition should be more usefull keybinding

vim.api.nvim_set_keymap('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', {})
vim.api.nvim_set_keymap('i', '<c-x><c-f>', '<plug>(fzf-complete-path)', {})
vim.api.nvim_set_keymap('i', '<c-x><c-l>', '<plug>(fzf-complete-line)', {})

-- FZF
vim.api.nvim_set_keymap('n', '<leader>bb',
                        '<cmd>Telescope buffers show_all_buffers=true<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>Telescope live_grep<CR>',
                        {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>s',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>",
                        {})
vim.api.nvim_set_keymap('n', 'S',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>",
                        {})

vim.api.nvim_set_keymap('', '<leader>t',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
                        {})
vim.api.nvim_set_keymap('', '<leader>T',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
                        {})

vim.api.nvim_set_keymap('n', '<leader>w',
                        "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>",
                        {})
vim.api.nvim_set_keymap('n', '<leader>W',
                        "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
                        {})

vim.api.nvim_set_keymap('n', '<leader>l',
                        "<cmd>lua require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>",
                        {})
vim.api.nvim_set_keymap('n', '<leader>L',
                        "<cmd>lua require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>",
                        {})

vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>:TestNearest<cr>',
                        {silent = true})
vim.api.nvim_set_keymap('n', '<leader>T', '<cmd>:TestFile<cr>', {silent = true})
vim.api
    .nvim_set_keymap('n', '<leader>a', '<cmd>:TestSuite<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>:TestLast<cr>', {silent = true})
vim.api
    .nvim_set_keymap('n', '<leader>g', '<cmd>:TestVisit<cr>', {silent = true})

-- "search current word
-- nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
-- vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
-- "  search in current file
-- nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
