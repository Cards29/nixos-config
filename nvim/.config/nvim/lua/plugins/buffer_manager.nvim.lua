return {
	"j-morano/buffer_manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- Keybindings are defined here for lazy-loading
	keys = {
		{
			"<leader>bm",
			function()
				require("buffer_manager.ui").toggle_quick_menu()
			end,
			desc = "Buffer Manager Menu",
		},
		-- Quick jump to the first 4 buffers
		{
			"<leader>1",
			function()
				require("buffer_manager.ui").nav_file(1)
			end,
			desc = "Buffer 1",
		},
		{
			"<leader>2",
			function()
				require("buffer_manager.ui").nav_file(2)
			end,
			desc = "Buffer 2",
		},
		{
			"<leader>3",
			function()
				require("buffer_manager.ui").nav_file(3)
			end,
			desc = "Buffer 3",
		},
		{
			"<leader>4",
			function()
				require("buffer_manager.ui").nav_file(4)
			end,
			desc = "Buffer 4",
		},
	},
}
