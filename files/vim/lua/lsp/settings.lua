return function()
  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end


    require "vim.lsp.protocol".CompletionItemKind = {
      "ﮜ [text]",
      " [method]",
      " [function]",
      " [constructor]",
      "ﰠ [field]",
      " [variable]",
      " [class]",
      " [interface]",
      " [module]",
      " [property]",
      " [unit]",
      " [value]",
      " [enum]",
      " [key]",
      " [snippet]",
      " [color]",
      " [file]",
      " [reference]",
      " [folder]",
      " [enum member]",
      " [constant]",
      " [struct]",
      "⌘ [event]",
      " [operator]",
      "⌂ [type]"
    }
end
