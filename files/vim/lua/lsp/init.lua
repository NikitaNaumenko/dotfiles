-- local servers = { 'lua_ls', 'tsserver', 'solargraph', 'elixirls', 'erlangls' }
local servers = {'elixirls'}

local lsp = require('lsp-zero').preset('recommended')

lsp.ensure_installed(servers)
lsp.nvim_workspace()

lsp.on_attach(function(_client, bufnr)
  local opts = { noremap = true, silent = true }
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>',
    opts)
  buf_set_keymap('n', '<space>f', '<cmd>LspZeroFormat<CR>', opts)
end)

for _, server in pairs(servers) do
  local config  = require("lsp.servers.".. server)
  lsp.configure(server, config)
end


local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    -- null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.lua_format,
    null_ls.builtins.diagnostics.credo
  }
})

lsp.setup()
