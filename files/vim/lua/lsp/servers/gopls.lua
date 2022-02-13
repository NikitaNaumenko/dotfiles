return function(config, on_attach)
    config.gopls.setup {
        cmd = {"gopls"},
        filetypes = {"go", "gomod"},
        on_attach = on_attach,
        flags = {debounce_text_changes = 150}
    }
end
