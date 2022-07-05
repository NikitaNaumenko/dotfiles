return function(config, on_attach)
    return {
        cmd = { "lemminx" },
        filetypes = { "xml" },
        on_attach = on_attach,
    }
end
