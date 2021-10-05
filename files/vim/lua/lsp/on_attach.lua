return function(client, bufnr)
  local options = { noremap = true, silent = true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  print("JOPA!")
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Show diagnostic(linter) info --
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', options)
  buf_set_keymap('n', '<leader>cd', ":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", options)

  -- Show doc --
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
  buf_set_keymap('n', 'K', ":lua require('lspsaga.hover').render_hover_doc()<CR>", options)

  -- Rename functions, classes, etc. --
  buf_set_keymap('n', '<leader>rn', ":lua require('lspsaga.rename').rename()<CR>", options)
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)



  -- Go to next/prev diagnostic issues --
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', options)
  buf_set_keymap('n', '[d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", options)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', options)
  buf_set_keymap('n', ']d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", options)

  -- Format with linter rules --
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", options)

  -- Go to definition --
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', options)

  -- Go to implementation (works for interfaces - go to implementation of interface) --
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)

  -- Show references and definitions in popup --
  buf_set_keymap('n', 'gh', ":lua require'lspsaga.provider'.lsp_finder()<CR>", options)
  -- Show preview defintion --
  buf_set_keymap('n', '<leader>pd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", options)
  -- Scroll in popups(definition, doc hover) --
  buf_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", options)
  buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", options)

  -- Show possible code action, it works with static languages in most cases --
  buf_set_keymap('n', 'ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", options)
  -- buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- Show signature of function --
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
  --
  -- Go to type definition (most cases for golang etc.) --
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)

  -- Show list of diagnostic issues --
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', options)

  -- Show list of references functions, classes, etc. --
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', options)


  -- Workspace directories for lsp --
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', options)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', options)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', options)
end
