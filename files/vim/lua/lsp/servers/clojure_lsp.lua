return function(config, on_attach)
  config.clojure_lsp.setup{
    cmd = { "clojure-lsp" },
    on_attach = on_attach,
    filetypes = { "clojure", "edn", "clj" },
    -- root_dir = root_pattern("project.clj", "deps.edn", ".git"),
  }
end
