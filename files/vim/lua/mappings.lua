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

vim.api.nvim_set_keymap("n", "<leader>ff", ":lua require'telescope.builtin'.find_files()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gf", ":lua require'telescope.builtin'.git_files()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>aa", ":lua require'telescope.builtin'.live_grep()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>af", ":lua require'telescope.builtin'.grep_string()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>bb", ":lua require'telescope.builtin'.buffers()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gs", ":lua require'telescope.builtin'.git_status()<cr>", { noremap = true })
