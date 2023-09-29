vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.completeopt = "menuone,noselect"
vim.bo.matchpairs = "(:),{:},[:],<:>"

vim.cmd.colorscheme('kanagawa')
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
  linespace = 0,
  termguicolors = true,
  cmdheight = 1,
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
