require("nvim-web-devicons").setup()
-- TODO: candidate for refactoring
require('nvim-autopairs').setup()
require 'hop'.setup()
require 'mind'.setup()

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.nvcode_termcolors = 256
vim.cmd("colorscheme dracula")

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.completeopt = "menuone,noselect"

vim.bo.matchpairs = "(:),{:},[:],<:>"
-- vim.g.coq_settings = { keymap = { jump_to_mark = '<c-n>'} }

-- more info :h vim.o
local editor_options = {
    compatible = false,
    background = "dark",

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
    updatetime = 100
}
for key, val in pairs(editor_options) do vim.o[key] = val end

local window_options = {
    number = true,
    cursorline = true,
    wrap = true,
    list = true
}
for key, val in pairs(window_options) do vim.wo[key] = val end

vim.api.nvim_set_hl(0, "@symbol", { link = "Identifier" })
require("mason-nvim-dap").setup({
    ensure_installed = { "elixir-ls" }
})
dap = require("dap")
dap.set_log_level('TRACE')
require 'mason-nvim-dap'.setup_handlers {
    function(source_name)
        -- all sources with no handler get passed here


        -- Keep original functionality of `automatic_setup = true`
        require('mason-nvim-dap.automatic_setup')(source_name)
    end,
    elixir = function(source_name)
        dap.adapters.mix_task= {
            type = 'executable',
            command = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/debugger.sh",
            args = {}
        }
        dap.configurations.elixir = {
            {

                name = "phx.server",
                request = "launch",
                task = "phx.server",
                projectDir = "${workspaceFolder}",
                type = "mix_task",
                startApps = true
            }
        }
    end,
}
-- local dap = require("dap")
