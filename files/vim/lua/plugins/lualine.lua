return function()
    require('lualine').setup {
        options = {
            theme = 'auto',
            section_separators = {'', ''},
            component_separators = {'⎰', '⎱'},
            icons_enabled = true
        },
        sections = {
            lualine_a = {{'mode', upper = true, icon = 'ﲵ'}},
            lualine_b = {{'branch', icon = ''}},
            lualine_c = {{'filename', file_status = true, path = 1}},
            lualine_x = {
                'encoding', 'fileformat', {'filetype', colored = false}
            },
            lualine_y = {{'diagnostics', sources = {'nvim_lsp'}}},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        extensions = {'fzf', 'nerdtree', 'fugitive'}
    }
end
