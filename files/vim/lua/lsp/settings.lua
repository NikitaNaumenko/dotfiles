return function()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    -- signs = true,
    underline = true,
    virtual_text = {prefix = '<'},
    float = {scope = 'line', border = 'rounded', focusable = false},
    severity_sort = true
  })

  -- define line number hl for lines with Lsp errors
  -- vim.cmd [[sign define DiagnosticSignWarn text= texthl= numhl=DiagnosticSignWarn linehl=]]
  -- vim.cmd [[sign define DiagnosticSignError text= texthl= numhl=DiagnosticSignError linehl=]]
  -- add borders to some floating things
  -- vim.lsp.handlers['textDocument/hover'] =
  --     lsp.with(vim.lsp.handlers.hover,
  --              {border = 'rounded', focusable = false})
  -- vim.lsp.handlers['textDocument/signatureHelp'] =
  --     lsp.with(vim.lsp.handlers.signature_help,
  --              {border = 'rounded', focusable = false})
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
  Variable = " ",
}

  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = icons[kind] or kind
  end
end
