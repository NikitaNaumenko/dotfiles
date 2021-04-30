return function(config, on_attach)
  config.tsserver.setup{
    cmd = { "npx", "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascript.jsx" },
    on_attach = on_attach
  }
end
