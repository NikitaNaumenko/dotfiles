return {
	{ "nvim-neotest/neotest-plenary" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"jfpedroza/neotest-elixir",
		},
		opts = { adapters = { "neotest-plenary", ["neotest-elixir"] = {} } },
	},
}
