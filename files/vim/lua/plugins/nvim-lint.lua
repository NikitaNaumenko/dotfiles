return {
  "mfussenegger/nvim-lint",
  opts = {
    -- Event to trigger linters
    linters_by_ft = {
    java = { "checkstyle" },
    --   -- Use the "*" filetype to run linters on all filetypes.
    --   -- ['*'] = { 'global linter' },
    --   -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
    --   -- ['_'] = { 'fallback linter' },
    --   -- ["*"] = { "typos" },
    },
    -- -- LazyVim extension to easily override linter options
    -- or add custom linters.
    ---@type table<string,table>
    linters = {
      checkstyle = {
        -- cmd = .. "gradlew checkstyleMain",
        -- config_file = 
        args = { '-c', LazyVim.root.get({normalize = true}) .. "/config/checkstyle/checkstyle.xml" }
        -- config_file = nil
      }
      -- -- Example of using selene only when a selene.toml file is present
      -- selene = {
      --   -- `condition` is another LazyVim extension that allows you to
      --   -- dynamically enable/disable linters based on the context.
      --   condition = function(ctx)
      --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
      --   end,
      -- },
    },
  }
}
