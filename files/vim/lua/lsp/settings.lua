return function()
    local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
    end

    vim.diagnostic.config({
        -- signs = true,
        underline = true,
        virtual_text = {prefix = '<'},
        float = {scope = 'line', border = 'rounded', focusable = false},
        severity_sort = true
    })

    local icons = {
        Class = " ",
        Color = " ",
        Constant = " ",
        Constructor = " ",
        Enum = "了 ",
        EnumMember = " ",
        Field = " ",
        File = " ",
        Folder = " ",
        Function = " ",
        Interface = "ﰮ ",
        Keyword = " ",
        Method = "ƒ ",
        Module = " ",
        Property = " ",
        Snippet = "﬌ ",
        Struct = " ",
        Text = " ",
        Unit = " ",
        Value = " ",
        Variable = " "
    }

    local kinds = vim.lsp.protocol.CompletionItemKind
    for i, kind in ipairs(kinds) do kinds[i] = icons[kind] or kind end
end
