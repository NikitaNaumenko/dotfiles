local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Utilities
    {"tpope/vim-commentary"},
    {"tpope/vim-surround"},
    {"tpope/vim-repeat"},
    {"tpope/vim-unimpaired"},
  { "rebelot/kanagawa.nvim", config = function () 
    require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = false },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})
  end},
    {"windwp/nvim-autopairs", event = "InsertEnter", opts = {}},
    {"lewis6991/gitsigns.nvim", event = {"BufReadPre", "BufNewFile"}},
    {'arcticicestudio/nord-vim'},
    {"hkupty/iron.nvim"},
    {'windwp/nvim-spectre'},
    {"junegunn/fzf.vim", dependencies = {{"junegunn/fzf", build = "./install --all"}}},
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("nvim-tree").setup {} end
    },
    {'nvim-treesitter/nvim-treesitter', build = ":TSUpdate", event = {"BufReadPost", "BufNewFile"}},
    {'nvim-treesitter/playground'},
    {'andymass/vim-matchup'},
    {'nvim-treesitter/nvim-treesitter-textobjects'},
    {'hoob3rt/lualine.nvim'},
    {'nvim-telescope/telescope.nvim'},
    {'mrjones2014/legendary.nvim'},
    {"nvim-neotest/neotest", dependencies = {"antoinemadec/FixCursorHold.nvim", "jfpedroza/neotest-elixir"}},
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<C-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<C-}>",
                        prev = "<C-{>",
                        dismiss = "<C-d>"
                    }
                }
            })
        end
    },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},

    --- Uncomment these if you want to manage LSP servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig', dependencies = {{'hrsh7th/cmp-nvim-lsp'}}},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = {"rafamadriz/friendly-snippets"}
    },
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},

    {"jose-elias-alvarez/null-ls.nvim"},
    {"folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons", config = function() require("trouble").setup {} end},
    {"nvim-lua/plenary.nvim", lazy = true},
    {"nvim-lua/popup.nvim", lazy = true},
    {"ggandor/leap.nvim", config = function() require('leap').add_default_mappings() end}

})
