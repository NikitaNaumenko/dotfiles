vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
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
  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>',
  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<CR>',
  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>Telescope live_grep<CR>',
  { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>tn",
  ':lua require("neotest").run.run()<CR>',
  { noremap = true })
-- test file
vim.api.nvim_set_keymap("n", "<leader>tf",
  ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
  { noremap = true })
-- stop nearest test (undo - use u because it is used in summary window as well)
vim.api.nvim_set_keymap("n", "<leader>tu",
  ':lua require("neotest").run.stop()<CR>',
  { noremap = true })
-- test summary
vim.api.nvim_set_keymap("n", "<leader>ts",
  ':lua require("neotest").summary.toggle()<CR>',
  { noremap = true })
-- test output
vim.api.nvim_set_keymap("n", "<leader>to",
  ':lua require("neotest").output.open({ enter = false })<CR>',
  { noremap = true })
