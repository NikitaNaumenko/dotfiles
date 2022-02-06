function WinMove(key)
    local curwin = vim.fn.winnr();

    local winCmd = string.format("wincmd %s", key)
    vim.cmd(winCmd)
    if curwin == vim.fn.winnr() then
        if (string.match(key, "[hl]")) then
            vim.cmd("wincmd v")
        else
            vim.cmd("wincmd s")
        end
        vim.cmd(winCmd)
    end
end

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {silent = true})

vim.api.nvim_set_keymap('n', '<leader>', '<Plug>(easymotion-prefix)', {})

vim.api.nvim_set_keymap('n', '<C-h>', ':lua WinMove("h")<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':lua WinMove("j")<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':lua WinMove("k")<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':lua WinMove("l")<CR>', {silent = true})
-- Close the current buffer and move to the previous one
vim.api.nvim_set_keymap('n', '<leader>bq', ':bp <BAR> bd #<CR>', {})

vim.api.nvim_set_keymap('n', '<leader><tab>', '<plug>(fzf-maps-n)', {})
-- Insert mode competition should be more usefull keybinding
--
vim.api.nvim_set_keymap('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', {})
vim.api.nvim_set_keymap('i', '<c-x><c-f>', '<plug>(fzf-complete-path)', {})
vim.api.nvim_set_keymap('i', '<c-x><c-j>', '<plug>(fzf-complete-file-ag)', {})
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
vim.api
    .nvim_set_keymap('n', 'K', '<cmd>Telescope grep_string', {noremap = true})
