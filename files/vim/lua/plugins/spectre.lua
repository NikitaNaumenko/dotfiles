local spectre = require("spectre")
spectre.setup()

vim.keymap.set('n', '<leader>of', function() spectre.open_file_search() end, {})
vim.keymap.set('n', '<leader>o', function() spectre.open() end, {})
vim.keymap.set('n', '<leader>ov', function() spectre.open() end, {})
