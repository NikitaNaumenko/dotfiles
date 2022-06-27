return function(config, on_attach)
    config.elixirls.setup {
        on_attach = on_attach,
        flags = {debounce_text_changes = 150}
    }
end

