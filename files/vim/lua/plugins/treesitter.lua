return function()
    require "nvim-treesitter.configs".setup {
        ensure_installed = { "lua", "ruby", "javascript", "json", "html", "dockerfile", "elixir", "cmake", "yaml",
            "erlang" },
        highlight = {
            enable = true, -- false will disable the whole extension
            use_languagetree = true,
        },
        indent = {
            enable = true,
        },
        matchup = {
            enable = true
        },
        rainbow = {
            enable = true,
            -- extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            -- max_file_lines = nil, -- Do not enable for files with more than n lines, int
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gnn',
                node_incremental = 'grn',
                scope_incremental = 'grc',
                node_decremental = 'grm',
            },
        },
        -- textobjects = {
        --     swap = {
        --         enable = true,
        --         swap_next = {
        --             ["<leader>a"] = "@parameter.inner",
        --         },
        --         swap_previous = {
        --             ["<leader>A"] = "@parameter.inner",
        --         },
        --     },
        --     lsp_interop = {
        --         enable = true,
        --         border = 'none',
        --         peek_definition_code = {
        --             ["<leader>df"] = "@function.outer",
        --             ["<leader>dF"] = "@class.outer",
        --         },
        --     },
        --     select = {
        --         enable = true,
        --         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        --         keymaps = {
        --             -- You can use the capture groups defined in textobjects.scm
        --             ['af'] = '@function.outer',
        --             ['if'] = '@function.inner',
        --             ['ac'] = '@class.outer',
        --             ['ic'] = '@class.inner',
        --             ['aa'] = '@parameter.outer',
        --             ['ia'] = '@parameter.inner',
        --         },
        --     },
        --     move = {
        --         enable = true,
        --         set_jumps = true, -- whether to set jumps in the jumplist
        --         goto_next_start = {
        --             [']m'] = '@function.outer',
        --             [']]'] = '@class.outer',
        --         },
        --         goto_next_end = {
        --             [']M'] = '@function.outer',
        --             [']['] = '@class.outer',
        --         },
        --         goto_previous_start = {
        --             ['[m'] = '@function.outer',
        --             ['[['] = '@class.outer',
        --         },
        --         goto_previous_end = {
        --             ['[M'] = '@function.outer',
        --             ['[]'] = '@class.outer',
        --         },
        --     },
        -- }
    }

    vim.api.nvim_set_hl(0, "@symbol", { link = "Identifier" })
end
