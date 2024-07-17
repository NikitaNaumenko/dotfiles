return {
	{
		"mfussenegger/nvim-jdtls",
		opts = {
			settings = {
				java = {
					format = {
					settings = {
						url = LazyVim.root.get({ normalize = true }) .. "/" .. "config/checkstyle/checkstyle.xml",
					-- 		profile = "SunStyle",
					},
					},
				},
			},
		},
	},
}
