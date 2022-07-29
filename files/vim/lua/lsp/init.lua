local general_on_attach = require("lsp.on_attach")
local util = require "lspconfig.util"
local lspconfig = require "lspconfig"

local servers = {'sumneko_lua', 'tsserver', 'sqls', 'solargraph', 'elixirls'}
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

util.default_config = vim.tbl_extend("force", util.default_config, {
    autostart = false,
    capabilities = capabilities
})
lspconfig.elixirls.setup(require("lsp.servers.elixirls")(general_on_attach))
lspconfig.tsserver.setup(require("lsp.servers.tsserver")(general_on_attach))
lspconfig.sumneko_lua.setup(
    require("lsp.servers.sumneko_lua")(general_on_attach))

require("lsp.settings")()

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.diagnostics.credo
    },
    on_attach = general_on_attach
})
