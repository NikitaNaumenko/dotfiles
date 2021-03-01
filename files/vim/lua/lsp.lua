require'lspconfig'.solargraph.setup{
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  -- root_dir = root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      diagnostics = true
    },
  },
}

