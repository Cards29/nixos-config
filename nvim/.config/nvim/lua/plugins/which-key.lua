return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "modern",

		win = {
			border = "rounded",
			padding = { 1, 2 },
			title = true,
			title_pos = "center",
		},

		layout = {
			spacing = 6,
			align = "center",
		},

		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
	},
}
