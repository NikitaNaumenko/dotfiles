vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.completeopt = "menuone,noselect"
vim.bo.matchpairs = "(:),{:},[:],<:>"

vim.api.nvim_command('colorscheme alabaster')
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

-- Plugins --
vim.g["test#strategy"] = "toggleterm"

local ansi = {
  black = "#000000",
  blue = "#325cc0",
  brightyellow = "#ffbc5d",
  cyan = "#0083b2",
  green = "#568A37",
  magenta = "#7a3e9d",
  red = "#aa3731",
  white = "#f7f7f7",
  yellow = "#cb9000"
}
local theme = {
  --- Treesitter
  Identifier = { fg = ansi.magenta },

  MatchupVirtualText = { fg = ansi.yellow },
  --- Hop
  HopNextKey = { fg = ansi.blue },
  HopNextKey1 = { fg = ansi.blue },
  HopNextKey2 = { fg = "#17A2D6" },
  HopUnmatched = { fg = "#bfbfbf" },
  ["@function"] = { fg = ansi.blue },
}

for k, v in pairs(theme) do vim.api.nvim_set_hl(0, k, v) end
