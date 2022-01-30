return function(on_attach)
  return {
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
            version = "LuaJIT",
        },
        diagnostics = {
            globals = {"vim", "use"}
        },
        workspace = {
            library = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        },
        telemetry = {
            enable = false
        }
      }
    }
  }
end
