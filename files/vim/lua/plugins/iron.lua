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
    highlight = {italic = true},
    ignore_blank_lines = true -- ignore blank lines when sending visual select lines
} -- iron also has a list of commands, see :h iron-commands for all available commands
