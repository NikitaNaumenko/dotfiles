return function()
    require"nvim-treesitter.configs".setup {
        ensure_installed = { "lua", "ruby", "javascript", "json", "html", "go", "dockerfile", "elixir", "cmake", "yaml", },
        highlight = {
            enable = true, -- false will disable the whole extension
        },
        autotag = { enable = true },
        indent = {
          enable = true,
        },
        matchup = {
          enable = true
        },
    }
end
