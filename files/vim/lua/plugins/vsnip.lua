return function()
    -- vim.cmd("imap <expr> <tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<tab>'")
    -- vim.cmd("imap <expr> <s-tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<s-tab>'")
    vim.g.vsnip_extra_mapping = false
end
