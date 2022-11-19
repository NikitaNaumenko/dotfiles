local servers = { 'sumneko_lua', 'tsserver', 'solargraph', 'elixirls' }

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed(servers)
lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
    local opts = {noremap = true, silent = true}
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>LspZeroFormat<CR>', opts)
end)

lsp.configure('elixirls', { flags = { debounce_text_changes = 150 } })
lsp.configure('sumneko_lua', {
        settings = {
            Lua = {
                runtime = {version = "LuaJIT"},
                diagnostics = {globals = {"vim", "use"}},
                workspace = {
                    library = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    }
                },
                telemetry = {enable = false}
            }
        }
    })

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.fixjson,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.diagnostics.credo
}})

lsp.setup()
