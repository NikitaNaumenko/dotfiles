local general_on_attach = require("lsp.on_attach")
local util = require "lspconfig.util"
local lspconfig = require "lspconfig"

local servers = {'sumneko_lua', 'tsserver', 'solargraph', 'elixirls'}
vim.g.coq_settings = {auto_start = 'shut-up'}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

local coq = require "coq"
capabilities = coq.lsp_ensure_capabilities(capabilities)
-- lspconfig["elixirls"].setup{pizda = pizda, flags = {debounce_text_changes = 150}}

lspconfig.tsserver.setup(require("lsp.servers.tsserver")(general_on_attach))
lspconfig.sumneko_lua.setup(
    require("lsp.servers.sumneko_lua")(general_on_attach))

lspconfig.elixirls.setup { cmd = { "/path/to/elixir-ls/language_server.sh" }}
util.default_config = vim.tbl_extend("force", util.default_config, {
    autostart = true,
    capabilities = capabilities
})


require("lsp.settings")()

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.fixjson,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.diagnostics.credo
    },
    on_attach = general_on_attach
})
