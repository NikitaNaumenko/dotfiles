require('nvim-autopairs').setup()
require 'hop'.setup()
require 'mind'.setup()

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd("colorscheme alabaster")

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.completeopt = "menuone,noselect"

vim.bo.matchpairs = "(:),{:},[:],<:>"

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
require 'nvim-web-devicons'.setup {
    override = {
        md = { icon = "", color = "#519aba", cterm_color = "74", name = "Md" }
    }
}

local dap = require('dap')
dap.adapters.mix_task = {
    type = 'executable',
    command = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/debugger.sh",
    args = {}
}

dap.set_log_level('TRACE')

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
    }, setmetatable({
        type = "mix_task",
        name = "test current file",
        task = 'test',
        request = "launch",
        startApps = true, -- for Phoenix projects
        projectDir = "${workspaceFolder}",
        requireFiles = { "test/**/test_helper.exs", "${file}" },
        env = { MIX_ENV = "test" }
    }, {
        __call = function(conf)
            local result = {}
            for k, v in pairs(conf) do result[k] = v end
            result.taskArgs = {
                "${file}" .. ":" .. vim.api.nvim__buf_stats(0).current_lnum
            }
            return result
        end
    })
}

require("dapui").setup()

-- Redefine default colors
local ansi = {
    black = "#000000",
    blue = "#325cc0",
    brightyellow = "#ffbc5d",
    cyan = "#0083b2",
    green = "#448c27",
    magenta = "#7a3e9d",
    red = "#aa3731",
    white = "#f7f7f7",
    yellow = "#cb9000"
}
local theme = {
    --- Treesitter
    Identifier = { fg = ansi.cyan },

    MatchupVirtualText = { fg = ansi.yellow },
    --- Hop
    HopNextKey = { fg = ansi.blue },
    HopNextKey1 = { fg = ansi.blue },
    HopNextKey2 = { fg = "#17A2D6" },
    HopUnmatched = { fg = "#bfbfbf" }
}

for k, v in pairs(theme) do vim.api.nvim_set_hl(0, k, v) end

local iron = require("iron.core")

iron.setup {
    config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
            -- sh = {
            --   -- Can be a table or a function that
            --   -- returns a table (see below)
            --   command = {"zsh"}
            -- }
            elixir = { command = { "iex", "-S", "mix"} }
        },
        -- How the repl window will be displayed
        -- See below for more information
        -- repl_open_cmd = require('iron.view').bottom(40)
        repl_open_cmd = "vertical botright 80 split"

    },
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    keymaps = {
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_mark = "<space>sm",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl"
    },
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    highlight = { italic = true },
    ignore_blank_lines = true -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
