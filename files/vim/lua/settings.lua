-- TODO: candidate for refactoring
require('nvim-autopairs').setup()
require 'hop'.setup()
require 'mind'.setup()

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.nvcode_termcolors = 256
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
    -- command = '~/.local/share/nvim/lsp_servers/elixir/elixir-ls/debugger.sh', -- debugger.bat for windows
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

-- dap.configurations.elixir.__call = {
--     {
--         type = "mix_task",
--         name = "test current file",
--         task = 'test',
--         taskArgs = { "${file}" },
--         request = "launch",
--         startApps = true, -- for Phoenix projects
--         projectDir = "${workspaceFolder}",
--         requireFiles = { "test/**/test_helper.exs", "${file}" },
--         env = { MIX_ENV = "test" }
--     }
-- }

require("dapui").setup()

-- vim.cmd("hi clear")
-- if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

-- vim.g.colors_name = "alabaster"

-- local theme
-----@diagnostic disable: undefined-global
---- terminal colors
-- vim.g.terminal_color_0 = "#000000"
-- vim.g.terminal_color_1 = "#aa3731"
-- vim.g.terminal_color_2 = "#448c27"
-- vim.g.terminal_color_3 = "#cb9000"
-- vim.g.terminal_color_4 = "#325cc0"
-- vim.g.terminal_color_5 = "#7a3e9d"
-- vim.g.terminal_color_6 = "#0083b2"
-- vim.g.terminal_color_7 = "#f7f7f7"
-- vim.g.terminal_color_8 = "#777777"
-- vim.g.terminal_color_9 = "#f05050"
-- vim.g.terminal_color_10 = "#60cb00"
-- vim.g.terminal_color_11 = "#ffbc5d"
-- vim.g.terminal_color_12 = "#007acc"
-- vim.g.terminal_color_13 = "#e64ce6"
-- vim.g.terminal_color_14 = "#00aacb"
-- vim.g.terminal_color_15 = "#f7f7f7"

---- colors
-- local bg = "#f7f7f7"
-- local fg = "#000000"
-- local punct_fg = "#777777"
-- local def_fg = "#325cc0"
-- local const_fg = "#7a3e9d"
-- local active = "#ffbc5d"
-- local active_blue = "#007acc"
-- local string_fg = "#448c27"
-- local darker_fg = "#7d7d7d"
-- local diffadd = "#284918"
-- local diffdelete = "#B40600"
-- local diffchange = "#ec8013"
-- local statusline = "#c9c9c9"
-- local comment = "#aa3731"
-- local dim_comment = "#696969"
-- local mistake = { fg = "#c33c33", bg = "#f8b28f" }
-- local ansi = {
--    black = "#000000",
--    blue = "#325cc0",
--    brightyellow = "#ffbc5d",
--    cyan = "#0083b2",
--    green = "#448c27",
--    magenta = "#7a3e9d",
--    red = "#aa3731",
--    white = "#f7f7f7",
--    yellow = "#cb9000"
-- }
-- local error = "#d13e23"
-- local warn = "#BC7500"
-- local hint = ansi.blue
-- local info = "#278C00"
-- local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
-- local pmenu_bg = "#e7e7e7"
-- local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
-- local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = "#999999" } or
--    { bg = float_bg, fg = float_bg }
-- theme = {
--    Comment = { fg = comment_fg },
--    ColorColumn = { bg = "#E2EEEE" },
--    Conceal = { fg = "#b0b0b0" },
--    Cursor = { bg = "#007acc", fg = "#bfdbfe" },
--    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
--    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
--    CursorColumn = { fg = fg, bg = "#E2EEEE" },
--    CursorLine = { bg = "#E2EEEE" },
--    Directory = { fg = ansi.blue },
--    DiffAdd = { bg = "#ADFFB7", fg = "#0A7816" },
--    DiffDelete = { bg = "#F8B28F", fg = "#872C28" },
--    DiffText = { fg = "#fff987", bg = "#876004" },
--    DiffChange = { bg = "#fff987", fg = "#341a00" },
--    EndOfBuffer = { fg = "#b6b6b6" },
--    -- TermCursor   { }, -- cursor in a focused terminal
--    TermCursorNC = { fg = bg, bg = fg },
--    ErrorMsg = { fg = error, bg = mistake.bg },
--    VertSplit = { fg = "#abbdc0" },
--    Folded = { bg = "#dddddd", fg = "#7d7d7d" },
--    FoldColumn = { bg = bg, fg = "#4d4d4d" },
--    SignColumn = {},
--    IncSearch = { bg = active, fg = fg },
--    -- Substitute   { }, -- |:substitute| replacement text highlighting
--    LineNr = { fg = "#7d7c7c" },
--    CursorLineNr = { fg = ansi.blue, bold = 1 },
--    MatchParen = { underline = 1, sp = active },
--    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
--    -- MsgArea      { }, -- Area for messages and cmdline
--    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
--    MoreMsg = { fg = ansi.green, bold = 1 },
--    NonText = { fg = "#696969" },
--    Normal = { bg = bg, fg = fg },
--    NormalFloat = { bg = float_bg },
--    -- NormalNC     { }, -- normal text in non-current windows
--    FloatBorder = floatborder,
--    Pmenu = { bg = pmenu_bg },
--    PmenuSel = { bg = "#c7c7c7" },
--    PmenuSbar = { bg = "#777777" },
--    PmenuThumb = { bg = "#333333" },
--    Question = { fg = ansi.green },
--    QuickFixLine = { bg = "#E2EEEE" },
--    Search = { bg = "#999999" },
--    SpecialKey = { fg = ansi.cyan },
--    SpellBad = { undercurl = 1, sp = ansi.red },
--    SpellCap = { undercurl = 1, sp = ansi.blue },
--    SpellLocal = { undercurl = 1, sp = ansi.cyan },
--    SpellRare = { undercurl = 1, sp = ansi.magenta },
--    StatusLine = { bg = statusline, fg = fg },
--    StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
--    TabLine = { bg = statusline, fg = "#7d7d7d" },
--    TabLineFill = { bg = statusline },
--    TabLineSel = { bg = statusline, fg = ansi.blue },
--    Title = { fg = const_fg },
--    Visual = { bg = "#bfdbfe" },
--    VisualNOS = { bg = "#bfdbfe" },
--    WarningMsg = { fg = "#e1ad4c" },
--    WildMenu = { bg = "#999999" },
--    WinBar = { bg = bg, fg = ansi.black, bold = true },
--    WinBarNC = { bg = bg, fg = "#7d7d7d" },

--    --- SYNTAX I: TS groups link to these
--    Constant = { fg = const_fg },
--    String = { fg = string_fg },
--    Character = { fg = const_fg },
--    Number = { fg = const_fg },
--    Boolean = { fg = const_fg },
--    Float = { fg = const_fg },
--    Operator = { fg = punct_fg },

--    --- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
--    Identifier = { fg = ansi.cyan },
--    Function = { fg = def_fg },
--    Statement = { fg = ansi.black },
--    Conditional = { fg = ansi.black },
--    Repeat = { fg = ansi.black },
--    Label = { fg = def_fg },
--    Keyword = { fg = ansi.black },
--    Exception = { fg = ansi.black },
--    PreProc = { fg = ansi.black },
--    Include = { fg = ansi.black },
--    Define = { fg = ansi.black },
--    Macro = { fg = ansi.black },
--    PreCondit = { fg = ansi.black },
--    Type = { fg = ansi.black },
--    StorageClass = { fg = ansi.black },
--    Structure = { fg = def_fg },
--    Typedef = { fg = def_fg },

--    Special = { fg = ansi.yellow },
--    -- TODO better color than diffchange, try reddish
--    -- SpecialChar = { fg = diffchange }, --  special character in a constant
--    -- Tag            { }, --    you can use CTRL-] on this
--    -- Delimiter      { },
--    SpecialComment = { bg = "#FFDEAA", fg = ansi.blue },
--    debugPc = { bg = "#C7C7EE" },
--    debugBreakpoint = { bg = "#F8B28F" },
--    helpHyperTextJump = { fg = ansi.magenta },
--    helpSectionDelim = { fg = ansi.magenta },
--    helpExample = { fg = ansi.cyan },
--    helpCommand = { fg = ansi.cyan },
--    helpHeadline = { fg = ansi.blue },
--    helpHeader = { fg = ansi.magenta },

--    Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
--    Italic = { italic = 1 },

--    -- ("Ignore", below, may be invisible...)
--    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

--    Error = { bg = mistake.bg, fg = mistake.fg },

--    Todo = { bg = "#FFDEAA", fg = ansi.blue },

--    --- Diagnostic
--    LspReferenceText = { bg = "#dadada" },
--    LspReferenceRdad = { bg = "#dadada" },
--    LspReferenceWrite = { bg = "#dadada", underline = 1, sp = active_blue },
--    LspCodeLens = { fg = "#999999" },
--    LspCodeLensSeparator = { fg = "#999999" },

--    --- Diagnostic
--    DiagnosticError = { fg = error },
--    DiagnosticWarn = { fg = warn },
--    DiagnosticHint = { fg = hint },
--    DiagnosticInfo = { fg = info },
--    DiagnosticVirtualTextError = { bg = "#F8B28F", fg = "#411414" },
--    DiagnosticVirtualTextWarn = { bg = "#fff987", fg = fg },
--    DiagnosticVirtualTextHint = { fg = "#0F171D", bg = "#C3D0DA" },
--    DiagnosticVirtualTextInfo = { bg = "#ADFFB7", fg = "#042F09" },

--    --- Treesitter
--    TSAttribute = {},
--    TSConstructor = { fg = ansi.black },
--    TSConditional = { fg = ansi.black },
--    TSConstBuiltin = { fg = const_fg },
--    TSConstMacro = { fg = ansi.black },
--    TSError = { bg = mistake.bg, fg = mistake.fg },
--    TSException = { fg = ansi.black },
--    TSField = { fg = ansi.black },
--    TSFunction = { fg = ansi.black },
--    TSFuncBuiltin = { fg = ansi.black },
--    TSFuncMacro = { fg = ansi.black },
--    TSKeyword = { fg = ansi.black },
--    TSKeywordFunction = { fg = ansi.black },
--    TSLabel = { fg = ansi.black },
--    TSMethod = { fg = ansi.black },
--    TSNamespace = { fg = ansi.black },
--    TSNone = { fg = const_fg },
--    TSParameter = { fg = ansi.black },
--    TSParameterReference = { fg = ansi.black },
--    TSProperty = { fg = ansi.black },
--    TSPunctDelimiter = { fg = punct_fg },
--    TSPunctBracket = { fg = punct_fg },
--    TSPunctSpecial = { fg = punct_fg },
--    TSRepeat = { fg = ansi.black },
--    TSString = { fg = string_fg },
--    TSStringRegex = { bg = bg, fg = "#777777" },
--    TSStringEscape = { bg = bg, fg = "#777777" },
--    TSSymbol = {},
--    TSType = { fg = ansi.black },
--    TSTypeBuiltin = { fg = ansi.black },
--    TSVariable = { fg = ansi.black },
--    TSVariableBuiltin = { fg = ansi.black },
--    TSTag = { fg = ansi.black },
--    TSTagDelimiter = { fg = punct_fg },
--    TSText = { fg = ansi.black },

--    ["@attribute"] = {},
--    ["@constructor"] = { fg = ansi.black },
--    ["@conditional"] = { fg = ansi.black },
--    ["@constant.builtin"] = { fg = const_fg },
--    ["@constant.macro"] = { fg = ansi.black },
--    ["@error"] = { bg = mistake.bg, fg = mistake.fg },
--    ["@exception"] = { fg = ansi.black },
--    ["@field"] = { fg = ansi.black },
--    ["@function"] = { fg = ansi.black },
--    ["@function.builtin"] = { fg = ansi.black },
--    ["@function.macro"] = { fg = ansi.black },
--    ["@keyword"] = { fg = ansi.black },
--    ["@keyword.function"] = { fg = ansi.black },
--    ["@label"] = { fg = ansi.black },
--    ["@method"] = { fg = ansi.black },
--    ["@namespace"] = { fg = ansi.black },
--    ["@none"] = { fg = const_fg },
--    ["@parameter"] = { fg = ansi.black },
--    ["@parameter.reference"] = { fg = ansi.black },
--    ["@property"] = { fg = ansi.black },
--    ["@punctuation.delimiter"] = { fg = punct_fg },
--    ["@punctuation.bracket"] = { fg = punct_fg },
--    ["@punctuation.special"] = { fg = punct_fg },
--    ["@repeat"] = { fg = ansi.black },
--    ["@string"] = { fg = string_fg },
--    ["@string.regex"] = { bg = bg, fg = "#777777" },
--    ["@string.escape"] = { bg = bg, fg = "#777777" },
--    ["@symbol"] = {},
--    ["@type"] = { fg = ansi.black },
--    ["@type.builtin"] = { fg = ansi.black },
--    ["@variable"] = { fg = ansi.black },
--    ["@variable.builtin"] = { fg = ansi.black },
--    ["@tag"] = { fg = ansi.black },
--    ["@tag.delimiter"] = { fg = punct_fg },
--    ["@text"] = { fg = ansi.black },
--    ["@text.note"] = { bg = "#1d292b", fg = ansi.blue },
--    ["@text.warning"] = { bg = "#FFDEAA", fg = ansi.blue },

--    --- Theme specific
--    AlabasterConstant = { fg = const_fg },
--    AlabasterDefinition = { fg = def_fg },
--    AlabasterPunct = { fg = punct_fg },
--    AlabasterString = { fg = string_fg },
--    --- Gitsigns
--    GitSignsAdd = { fg = "#6abf40" },
--    GitSignsChange = { fg = diffchange },
--    GitSignsDelete = { fg = diffdelete },
--    --- Telescope
--    TelescopeBorder = { fg = "#abbdc0" },
--    TelescopeMatching = { fg = "#CC6F14" },
--    TelescopeMultiSelection = { fg = ansi.magenta },
--    TelescopePromptPrefix = { fg = ansi.blue },
--    TelescopeSelectionCaret = { fg = mistake.fg },
--    TelescopeTitle = { fg = ansi.yellow },
--    TelescopeResultsTitle = { fg = ansi.yellow },
--    --- fzf-lua
--    FzfLuaBorder = { fg = "#abbdc0" },
--    --- Neogit
--    NeogitPopupActionDisabled = { fg = darker_fg },
--    NeogitPopupActionKey = { fg = ansi.magenta },
--    NeogitPopupOptionDisabled = { fg = darker_fg },
--    NeogitPopupOptionKey = { fg = ansi.blue },
--    NeogitPopupSwitchDisabled = { fg = darker_fg },
--    NeogitPopupSwitchEnabled = { fg = ansi.cyan },
--    NeogitPopupSwitchKey = { fg = ansi.magenta },
--    --- Fugitive
--    diffAdded = { link = "DiffAdd" },
--    diffRemoved = { link = "DiffDelete" },
--    --- Startify
--    StartifyBracket = { fg = darker_fg },
--    StartifyFile = { fg = ansi.black },
--    StartifySection = { fg = ansi.green },
--    StartifySlash = { fg = "#4e6e75" },
--    StartifyPath = { fg = "#4e6e75" },
--    --- Statusline
--    StatuslineAdd = { fg = diffadd, bg = statusline },
--    StatuslineErr = { fg = "#8E1410", bg = statusline },
--    StatuslineHint = { fg = hint, bg = statusline },
--    StatuslineInfo = { fg = info, bg = statusline },
--    StatuslineWarn = { fg = warn, bg = statusline },
--    StatuslineBlue = { fg = ansi.blue, bg = statusline },
--    StatuslineRed = { fg = ansi.red, bg = statusline },
--    StatuslineGreen = { fg = ansi.green, bg = statusline },
--    StatuslineCyan = { fg = ansi.cyan, bg = statusline },
--    StatuslineMagenta = { fg = ansi.magenta, bg = statusline },
--    --- ALE
--    ALEWarningSign = { fg = warn },
--    --- vim-matchup
--    MatchupVirtualText = { fg = ansi.yellow },
--    --- For `highlight link`
--    AlabasterBlack = { fg = ansi.black },
--    AlabasterBlue = { fg = ansi.blue },
--    AlabasterBrightYellow = { fg = ansi.brightyellow },
--    AlabasterCyan = { fg = ansi.cyan },
--    AlabasterGreen = { fg = ansi.green },
--    AlabasterBrightGreen = { fg = "#60cb00" },
--    AlabasterMagenta = { fg = ansi.magenta },
--    AlabasterRed = { fg = ansi.red },
--    AlabasterWhite = { fg = ansi.black },
--    AlabasterYellow = { fg = ansi.yellow },
--    --- Hop
--    HopNextKey = { fg = ansi.yellow },
--    HopNextKey1 = { fg = ansi.blue },
--    HopNextKey2 = { fg = "#17A2D6" },
--    HopUnmatched = { fg = "#bfbfbf" },
--    --- Lightspeed
--    LightspeedGreyWash = { fg = "#bfbfbf" },
--    --- checkhealth
--    healthSuccess = { fg = ansi.green, bg = bg },
--    --- cmp
--    CmpItemMenuDefault = { fg = ansi.magenta },
--    --- nvim-ts-rainbow
--    rainbowcol1 = { fg = ansi.yellow },
--    rainbowcol2 = { fg = ansi.magenta },
--    rainbowcol3 = { fg = ansi.blue },
--    rainbowcol4 = { fg = ansi.green },
--    rainbowcol5 = { fg = ansi.brightyellow },
--    rainbowcol6 = { fg = ansi.red },
--    rainbowcol7 = { fg = ansi.cyan },
--    --- Iswap
--    ISwapSnipe = { bg = ansi.yellow, fg = bg },
--    ISwapGrey = { fg = "#bfbfbf" },
--    --- vim-dadbod-ui
--    dbui_help = { fg = dim_comment },
--    dbui_connection_source = { fg = dim_comment },
--    --- nvim-dap-virtual-text
--    NvimDapVirtualText = { bg = "#78D2C9", fg = fg },
--    --- Noice
--    NoiceCmdlineIcon = { link = "AlabasterBrightGreen" },
--    NoiceCmdlinePopupBorder = { link = "AlabasterBrightGreen" },
--    NoiceConfirmBorder = { link = "AlabasterBrightGreen" },
--    NoiceCmdlinePopupBorderCmdline = { link = "AlabasterBrightGreen" },
--    NoiceCmdlineIconCmdline = { link = "AlabasterBrightGreen" },
--    NoiceCmdlinePopupBorderFilter = { link = "AlabasterBrightGreen" },
--    NoiceCmdlineIconFilter = { link = "AlabasterBrightGreen" },
--    NoiceCmdlinePopupBorderLua = { link = "AlabasterBrightGreen" },
--    NoiceCmdlineIconLua = { link = "AlabasterBrightGreen" },
--    NoiceCmdlinePopupBorderSearch = { link = "AlabasterYellow" },
--    NoiceCmdlineIconSearch = { link = "AlabasterYellow" },
--    -- Languages
--    --- asm
--    asmDirective = { fg = dim_comment }
-- }

---- hlmap
-- local hl_map = {
--    "AlabasterDefinition", "AlabasterPunct", "AlabasterString",
--    "AlabasterConstant"
-- }

-- local link_captures = nil
-- if vim.treesitter.highlighter.hl_map then
--    link_captures = function(_, highlight_group)
--        vim.treesitter.highlighter.hl_map[highlight_group] = highlight_group
--    end
-- else
--    link_captures = function(_, highlight_group)
--        vim.api.nvim_set_hl(0, "@" .. highlight_group, { link = highlight_group })
--    end
-- end

-- for key, value in pairs(hl_map) do link_captures(key, value) end

-- for k, v in pairs(theme) do vim.api.nvim_set_hl(0, k, v) end
