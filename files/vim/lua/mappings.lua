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


vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>:TestNearest<cr>',
                        {silent = true})
vim.api.nvim_set_keymap('n', '<leader>T', '<cmd>:TestFile<cr>', {silent = true})
vim.api
    .nvim_set_keymap('n', '<leader>a', '<cmd>:TestSuite<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>:TestLast<cr>', {silent = true})
vim.api
    .nvim_set_keymap('n', '<leader>g', '<cmd>:TestVisit<cr>', {silent = true})
