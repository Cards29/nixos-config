return {
	"aikhe/wrapped.nvim", -- replace with the actual repository name
	dependencies = { "nvzone/volt" },
	cmd = { "NvimWrapped" },
	keys = {
		{ "<leader><leader>", "<cmd>NvimWrapped<CR>", { desc = "Open Nvim Config Activity" } },
	},
	opts = {
		path = vim.fn.expand("~/dotfiles/nvim/.config/nvim"),
		border = false,
		size = {
			width = 120,
			height = 40,
		},
		exclude_filetype = {
			".gitmodules",
		},
		cap = {
			commits = 1000,
			plugins = 200,
			plugins_ever = 200,
			lines = 10000,
		},
	},
}
