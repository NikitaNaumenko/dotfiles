function WinMove(key)
  local curwin = vim.fn.winnr();

  local winCmd = string.format("wincmd %s", key)
  vim.cmd(winCmd)
  if curwin == vim.fn.winnr() then
    if (string.match(key ,"[hl]")) then
      vim.cmd("wincmd v")
    else
      vim.cmd("wincmd s")
    end
  vim.cmd(winCmd)
  end
end

vim.api.nvim_set_keymap('n', '<leader><leader>', ':NERDTreeToggle <CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>', '<Plug>(easymotion-prefix)', {})

vim.api.nvim_set_keymap('n', '<C-h>', ':lua WinMove("h")<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':lua WinMove("j")<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':lua WinMove("k")<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':lua WinMove("l")<CR>', { silent = true })

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

-- LSP
--
vim.cmd("imap <expr> <tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<tab>'")
--  vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<tab>'
-- vim.api.nvim_set_keymap('i', '<Tab>', 'vsnip#expandable() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
-- vim.api.nvim_set_keymap('i', '<Tab>', 'vsnip#available(1) ? "\\<Plug>(vsnip-expand-or-jump)" : "\\<Tab>"', {expr = true})
-- vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

vim.api.nvim_set_keymap('i', '<C-Space>', "compe#complete()", { expr = true })
vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm(luaeval("require "nvim-autopairs".autopairs_cr()"))', { expr = true })
vim.api.nvim_set_keymap('i', '<C-e>', "compe#close('<C-e>')", { expr = true })
vim.api.nvim_set_keymap('i', '<C-f>', "compe#scroll({ 'delta': +4 })", { expr = true })
vim.api.nvim_set_keymap('i', '<C-d>', "compe#scroll({ 'delta': -4 })", { expr = true })

-- FZF
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>Telescope buffers show_all_buffers=true<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>Telescope live_grep<CR>', { noremap = true })



-- Clojure
-- ee - evaluate inner
-- er - evaluate outer
-- e! eval and replace
-- mf - put mark and emf - evaluate that mark
-- ew inspect
-- E - inspect in visual mode
-- Eiw evalute word
