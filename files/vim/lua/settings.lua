-- TODO: candidate for refactoring
require('nvim-autopairs').setup()
require 'hop'.setup()
require 'mind'.setup()

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.nvcode_termcolors = 256
-- vim.cmd("colorscheme dracula")
require("github-theme").setup({
  theme_style = "light",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"},

  -- Overwrite the highlight groups
  -- overrides = function(c)
  --   return {
  --     htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
  --     DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
  --     -- this will remove the highlight groups
  --     TSField = {},
  --   }
  -- end
})


vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.completeopt = "menuone,noselect"

vim.bo.matchpairs = "(:),{:},[:],<:>"
-- vim.g.coq_settings = { keymap = { jump_to_mark = '<c-n>'} }

-- more info :h vim.o
local editor_options = {
    compatible = false,
    background = "light",

    encoding = "UTF-8",
    fileencoding = "UTF-8",
    langmenu = "en_US.UTF-8",

    backup = false,
    swapfile = false,
    autoread = true,
    autowrite = true,
    writebackup = false,
    history = 50,
    laststatus = 2,
    shell = os.getenv("SHELL"),
    tabstop = 2,
    expandtab = true,
    shiftwidth = 2,
    showbreak = "↪| ",
    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    showmode = false,
    linespace = 2,
    termguicolors = true,
    cmdheight = 2,
    updatetime = 100,
    timeoutlen = 500
}
for key, val in pairs(editor_options) do vim.o[key] = val end

local window_options = {
    number = true,
    cursorline = true,
    wrap = true,
    list = true
}
for key, val in pairs(window_options) do vim.wo[key] = val end

-- require("mason-nvim-dap").setup({
--     ensure_installed = { "elixir-ls" }
-- })
-- dap = require("dap")
-- dap.set_log_level('TRACE')
-- require 'mason-nvim-dap'.setup_handlers {
--     function(source_name)
--         -- all sources with no handler get passed here


--         -- Keep original functionality of `automatic_setup = true`
--         require('mason-nvim-dap.automatic_setup')(source_name)
--     end,
--     elixir = function(source_name)
--         dap.adapters.mix_task = {
--             type = 'executable',
--             command = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/debugger.sh",
--             args = {}
--         }
--         dap.configurations.elixir = {
--             {
--                 type = "mix_task",
--                 name = "mix test",
--                 task = 'test',
--                 taskArgs = { "--trace" },
--                 request = "launch",
--                 startApps = true, -- for Phoenix projects
--                 projectDir = "${workspaceFolder}",
--                 -- requireFiles = {
--                 --     "test/**/test_helper.exs",
--                 --     "test/**/*_test.exs"
--                 -- }
--             },
--         }
--     end,
-- }
vim.api.nvim_set_hl(0, "@symbol", { link = "Identifier" })
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  md = {
    icon = "",
    color = "#519aba",
    cterm_color = "74",
    name = "Md",
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

