return {
	"stevearc/quicker.nvim",
	event = "VeryLazy",
	opts = {
		number = true,
		relativenumber = true,
		wrap = true,
		keys = {
			{
				">",
				function()
					require("quicker").expand({ add_to_existing = true })
				end,
				desc = "Expand quickfix context",
			},
			{
				"<",
				function()
					require("quicker").collapse()
				end,
				desc = "Collapse quickfix context",
			},
		},
	},
}
