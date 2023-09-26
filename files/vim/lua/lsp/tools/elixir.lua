local M = {}

local get_cursor_position = function()
  local rowcol = vim.api.nvim_win_get_cursor(0)
  local row = rowcol[1] - 1
  local col = rowcol[2]

  return row, col
end

local manipulate_pipes = function(direction, client)
  local row, col = get_cursor_position()

  client.request_sync("workspace/executeCommand", {
    command = "manipulatePipes:serverid",
    arguments = {
      direction, "file://" .. vim.api.nvim_buf_get_name(0), row, col
    }
  }, nil, 0)
end

M.from_pipe = function(client)
  return function() manipulate_pipes("fromPipe", client) end
end

M.to_pipe = function(client)
  return function() manipulate_pipes("toPipe", client) end
end

M.expand_macro = function(client)
  return function()
    local params = vim.lsp.util.make_given_range_params()

    local text = vim.api.nvim_buf_get_text(0, params.range.start.line,
      params.range.start.character,
      params.range["end"].line,
      params.range["end"].character, {})

    local resp = client.request_sync("workspace/executeCommand", {
      command = "expandMacro:serverid",
      arguments = {
        params.textDocument.uri, vim.fn.join(text, "\n"),
        params.range.start.line
      }
    }, nil, 0)

    local content = {}
    if resp["result"] then
      for k, v in pairs(resp.result) do
        vim.list_extend(content, { "# " .. k, "" })
        vim.list_extend(content, vim.split(v, "\n"))
      end
    else
      table.insert(content, "Error")
    end

    -- not sure why i need this here
    vim.schedule(function()
      vim.lsp.util.open_floating_preview(
        vim.lsp.util.trim_empty_lines(content), "elixir", {})
    end)
  end
end

M.on_attach = function(client, bufnr)
  local add_user_cmd = vim.api.nvim_buf_create_user_command
  -- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  --   buffer = bufnr,
  --   callback = vim.lsp.codelens.refresh
  -- })
  -- vim.lsp.codelens.refresh()
  add_user_cmd(bufnr, "ElixirFromPipe", M.from_pipe(client), {})
  add_user_cmd(bufnr, "ElixirToPipe", M.to_pipe(client), {})
  add_user_cmd(bufnr, "ElixirExpandMacro", M.expand_macro(client), { range = true })
end

return M
