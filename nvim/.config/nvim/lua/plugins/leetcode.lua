return {
	"kawre/leetcode.nvim",
	lazy = false,
	build = ":TSUpdate html",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>lc", "<cmd>Leet<CR>", desc = "LeetCode Dashboard" },
		{ "<leader>lp", "<cmd>Leet list<CR>", desc = "LeetCode Problem List" },
		{ "<leader>lr", "<cmd>Leet run<CR>", desc = "LeetCode Run" },
		{ "<leader>ls", "<cmd>Leet submit<CR>", desc = "LeetCode Submit" },
		{ "<leader>ld", "<cmd>Leet desc<CR>", desc = "LeetCode Toggle Description" },
		{ "<leader>lt", "<cmd>Leet console<CR>", desc = "LeetCode Console/Testcases" },
		{ "<leader>li", "<cmd>Leet info<CR>", desc = "LeetCode Stats/Info" },
		{ "<leader>lo", "<cmd>Leet open<CR>", desc = "LeetCode Open in Browser" },
		{ "<leader>ly", "<cmd>Leet yank<CR>", desc = "LeetCode Yank Solution" },
	},
	opts = {},
}
