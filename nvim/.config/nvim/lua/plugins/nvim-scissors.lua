-- Plugin: chrisgrieser/nvim-scissors
-- Installed via store.nvim

return {
	"chrisgrieser/nvim-scissors",
	dependencies = "folke/snacks.nvim", -- either snacks, fzf-lua, telescope
	-- dependencies = "ibhagwan/fzf-lua",
	-- dependencies = "nvim-telescope/telescope.nvim",
	keys = {
		{
			"<leader>se",
			function()
				require("scissors").editSnippet()
			end,
			desc = "Snippet: Edit",
		},
		{
			"<leader>sa",
			function()
				require("scissors").addNewSnippet()
			end,
			mode = { "n", "x" },
			desc = "Snippet: Add",
		},
	},
	opts = {
		snippetDir = vim.fn.stdpath("config") .. "/snippets",
	},
}
