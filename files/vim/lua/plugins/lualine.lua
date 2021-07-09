return function()
  require('lualine').setup{
    options = {
      theme = 'dracula',
      section_separators = {'', ''},
      component_separators = {'⎰', '⎱'},
      icons_enabled = true,
    },
    sections = {
      -- ﳟ
      lualine_a = { {'mode', upper = true, icon = 'ﲵ' } },
      lualine_b = { {'branch', icon = ''} },
      lualine_c = { {'filename', file_status = true, path = 1} },
      lualine_x = { 'encoding', 'fileformat', { 'filetype', colored = false } },
      lualine_y = { { 'diagnostics', sources = { 'nvim_lsp' } } },
      lualine_z = { 'location', icon = 'ﬦ' },
    },
    inactive_sections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {   },
      lualine_z = {   }
    },
    extensions = { 'fzf', 'nerdtree', 'fugitive' }
  }
end
