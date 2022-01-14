local lsp_config = require("lspconfig")
local general_on_attach = require("lsp.on_attach")


local lsp_installer = require "nvim-lsp-installer"
local servers = {
  'yamlls', 'diagnosticls', 'eslint',
  'emmet_ls', 'gopls', 'html', 'jsonls', 'tsserver', 'dockerls', 'solargraph', 'sqlls', 'sorbet',
}
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end


-- Install missing lsp servers --
-- for _, server in pairs(servers) do
--   require'lspconfig'[server].setup{}
-- end

-- for _, server in pairs({"bashls","efm", "jsonls", "sumneko_lua", "typescript-language-server", "yamlls", }) do
for _, server in pairs({ "solargraph", "gopls", "tsserver", "clojure_lsp" }) do
  require("lsp.servers." .. server)(lsp_config, general_on_attach)
end

require("lsp.commands")()
require("lsp.settings")()
