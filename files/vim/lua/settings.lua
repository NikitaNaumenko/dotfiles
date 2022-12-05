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
require 'nvim-web-devicons'.setup {
    override = {
        md = { icon = "", color = "#519aba", cterm_color = "74", name = "Md" }
    }
}

local dap = require('dap')
dap.adapters.mix_task = {
    type = 'executable',
    command = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/debugger.sh",
    -- command = '~/.local/share/nvim/lsp_servers/elixir/elixir-ls/debugger.sh', -- debugger.bat for windows
    args = {}
}

dap.set_log_level('TRACE')

print("${file}")
dap.configurations.elixir = {
    {
        type = "mix_task",
        name = "mix test",
        task = 'test',
        taskArgs = { "--trace" },
        request = "launch",
        startApps = true, -- for Phoenix projects
        projectDir = "${workspaceFolder}",
        requireFiles = { "test/**/test_helper.exs", "test/**/*_test.exs" },
        env = { MIX_ENV = "test" }
    }, {
        type = "mix_task",
        name = "phx_server",
        request = "launch",
        task = "phx.server",
        projectDir = "${workspaceFolder}"
    }, {
        type = "mix_task",
        name = "mix test",
        task = 'test',
        taskArgs = { "${file}" },
        request = "launch",
        startApps = true, -- for Phoenix projects
        projectDir = "${workspaceFolder}",
        requireFiles = {
            "test/**/test_helper.exs",
            "${file}"
        },
        env = { MIX_ENV = "test" }
    }
}

require("dapui").setup()
