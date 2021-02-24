return function()
    local telescope = require "telescope"
    local sorters = require "telescope.sorters"
    local previewers = require "telescope.previewers"
    telescope.setup {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--no-ignore",
                "--hidden",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case"
            },
          -- prompt_position = "top",
            -- prompt_prefix = " ❯",
            file_ignore_patterns = {".git", "node_modules"},
    -- file_sorter = sorters.get_fzy_sorter,
    -- generic_sorter = sorters.get_fzy_sorter,
    -- file_previewer = previewers.vim_buffer_cat.new,
    -- grep_previewer = previewers.vim_buffer_vimgrep.new,
    -- qflist_previewer = previewers.vim_buffer_qflist.new,

        }
    }
end

