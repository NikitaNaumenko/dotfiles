return {
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			opts.endwise = {
				enable = true,
			}
			opts.swap = {
				enable = true,
			}

			local tbl_filetypes = require("nvim-ts-autotag.internal").tbl_filetypes
			opts.autotag = {
				enable = true,
			}

			opts.select = {
				enable = true,
			}
			opts.textobjects = {
				lsp_interop = {
					enable = true,
				},
			}
		end,
	},
}
