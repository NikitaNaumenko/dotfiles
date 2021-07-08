return function(config, on_attach)
  config.solargraph.setup{
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    on_attach = on_attach,
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
