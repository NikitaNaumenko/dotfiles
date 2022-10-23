return function()
    require"nvim-treesitter.configs".setup {
        ensure_installed = { "lua", "ruby", "javascript", "json", "html", "dockerfile", "elixir", "cmake", "yaml", "erlang" },
        highlight = {
            enable = true, -- false will disable the whole extension
        },
        indent = {
          enable = true,
        },
        matchup = {
          enable = true
        },
    }

  vim.api.nvim_set_hl(0, "@symbol", { link = "Identifier" })
end
