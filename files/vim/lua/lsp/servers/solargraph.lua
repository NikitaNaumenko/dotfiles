return function(config, on_attach)
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   }
-- }

  config.solargraph.setup{
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      solargraph = {
        diagnostics = true
      },
    },
  }
end
