require'lspconfig'.solargraph.setup{
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  settings = {
    solargraph = {
      diagnostics = true
    },
  },
}

