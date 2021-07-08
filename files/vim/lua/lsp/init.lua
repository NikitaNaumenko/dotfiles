local lsp_config = require("lspconfig")
local general_on_attach = require("lsp.on_attach")

-- for _, server in pairs({"bashls","efm", "jsonls", "sumneko_lua", "typescript-language-server", "yamlls", }) do
for _, server in pairs({ "solargraph", "tsserver", "gopls" }) do
  require("lsp.servers." .. server)(lsp_config, general_on_attach, capabilities)
end

require("lsp.commands")()
require("lsp.settings")()
