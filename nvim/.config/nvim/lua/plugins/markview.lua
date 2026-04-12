return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	keys = {
		{ "<leader>mv", "<cmd>Markview splitToggle<CR>", { desc = "Markview Split Toggle" } },
	},
	opts = {
		initial_state = false,
		preview = {
			icon_provider = "devicons",
			enable = false,
		},
	},
}
