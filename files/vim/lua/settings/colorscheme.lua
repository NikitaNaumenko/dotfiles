vim.cmd("colorscheme alabaster")
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
    Identifier = {fg = ansi.cyan},

    MatchupVirtualText = {fg = ansi.yellow},
    --- Hop
    HopNextKey = {fg = ansi.blue},
    HopNextKey1 = {fg = ansi.blue},
    HopNextKey2 = {fg = "#17A2D6"},
    HopUnmatched = {fg = "#bfbfbf"}
}

for k, v in pairs(theme) do vim.api.nvim_set_hl(0, k, v) end
