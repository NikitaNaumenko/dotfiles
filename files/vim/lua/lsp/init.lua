require("lsp.settings")()
local general_on_attach = require("lsp.on_attach")
local lsp_installer = require "nvim-lsp-installer"

local servers = { 'sumneko_lua', 'tsserver', }

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
  local serverConfig = require("lsp.servers." .. server.name)(general_on_attach)
  serverConfig.capabilities = capabilities

  server:setup(serverConfig)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
