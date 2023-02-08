local iron = require("iron.core")

iron.setup {
    config = {
        scratch_repl = true,
        repl_definition = {elixir = {command = {"iex", "-S", "mix"}}},
        repl_open_cmd = require("iron.view").offset {
            width = 90,
            height = 20,
            w_offset = "40%",
            -- h_offset = "30%"
        }
    },
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    keymaps = {
        send_motion = "<space>ec",
        visual_send = "<space>ec",
        send_file = "<space>ef",
        send_line = "<space>el",
        send_mark = "<space>em",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>e<cr>",
        interrupt = "<space>e<space>",
        exit = "<space>eq",
        clear = "<space>el"
    },
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    highlight = {italic = true},
    ignore_blank_lines = true -- ignore blank lines when sending visual select lines
} -- iron also has a list of commands, see :h iron-commands for all available commands

vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
