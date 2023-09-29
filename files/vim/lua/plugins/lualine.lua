require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '',
    section_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch', {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error', 'warn', 'info', 'hint' },

        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = 'DiagnosticError', -- Changes diagnostics' error color.
          warn = 'DiagnosticWarn', -- Changes diagnostics' warn color.
          info = 'DiagnosticInfo', -- Changes diagnostics' info color.
          hint = 'DiagnosticHint' -- Changes diagnostics' hint color.
        },
        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
        colored = true, -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false
      }, { 'filename', file_status = false, path = 1 },
      { '%w', cond = function() return vim.wo.previewwindow end },
      { '%r', cond = function() return vim.bo.readonly end },
      { '%q', cond = function()
        return vim.bo.buftype == 'quickfix'
      end }
    },
    lualine_c = {},
    lualine_x = { 'filetype', { 'diff', colored = true } },
    lualine_y = {},

    lualine_z = { '%l:%c', '%p%%/%L' }
  },
  inactive_sections = { lualine_c = { '%f %y %m' }, lualine_x = {} }
}
