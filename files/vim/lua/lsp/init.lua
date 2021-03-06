local lsp_config = require("lspconfig")
local general_on_attach = require("lsp.on_attach")

require'lspinstall'.setup()

-- Install missing lsp servers --
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end

-- for _, server in pairs({"bashls","efm", "jsonls", "sumneko_lua", "typescript-language-server", "yamlls", }) do
for _, server in pairs({ "solargraph", "gopls", "tsserver" }) do
  require("lsp.servers." .. server)(lsp_config, general_on_attach)
end

require("lsp.commands")()
require("lsp.settings")()
