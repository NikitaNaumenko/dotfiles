return function(config, on_attach)
    return {on_attach = on_attach, flags = {debounce_text_changes = 150}}
end
