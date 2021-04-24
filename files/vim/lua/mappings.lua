vim.api.nvim_set_keymap('n', '<leader><leader>', ':NERDTreeToggle <CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>', '<Plug>(easymotion-prefix)', {})

vim.api.nvim_set_keymap('n', '<C-h>', ':call WinMove("h")<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':call WinMove("j")<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':call WinMove("k")<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':call WinMove("l")<CR>', { silent = true })

-- Close the current buffer and move to the previous one
vim.api.nvim_set_keymap('n', '<leader>bq', ':bp <BAR> bd #<CR>', {})

vim.api.nvim_set_keymap('n', '<leader><tab>', '<plug>(fzf-maps-n)', {})
vim.api.nvim_set_keymap('x', '<leader><tab>', '<plug>(fzf-maps-x)', {})
vim.api.nvim_set_keymap('o', '<leader><tab>', '<plug>(fzf-maps-o)', {})

-- Insert mode competition should be more usefull keybinding
vim.api.nvim_set_keymap('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', {})
vim.api.nvim_set_keymap('i', '<c-x><c-f>', '<plug>(fzf-complete-path)', {})
vim.api.nvim_set_keymap('i', '<c-x><c-j>', '<plug>(fzf-complete-file-ag)', {})
vim.api.nvim_set_keymap('i', '<c-x><c-l>', '<plug>(fzf-complete-line)', {})

-- vim.api.nvim_set_keymap('n', '<leader>bb', ':Buffers<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>gf', ':GFiles<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>fc', ':Commits<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>aa', ':Ag<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>ff', ':Files <CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', { noremap = true, silent = true })
--
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>Telescope buffers show_all_buffers=true<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>Telescope lsp_document_diagnostics<CR>', { noremap = true })


