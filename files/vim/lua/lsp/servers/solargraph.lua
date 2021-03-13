return function(config, on_attach)
  config.solargraph.setup{
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    on_attach = on_attach,
    settings = {
      solargraph = {
        diagnostics = true
      },
    },
  }
end
