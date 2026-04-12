-- Plugin: f-person/git-blame.nvim
-- Installed via store.nvim

return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = false,
		-- Refined template: removes extra brackets around SHA for a cleaner look
		message_template = "  <summary> • <date> • <author> • <sha>",
		date_format = "%d-%m-%Y %H:%M", -- Switched to ISO-style for better readability
		virtual_text_column = 1,

		-- Enhanced options
		message_when_not_committed = "Uncommitted changes",
		highlight_group = "GitBlameMsg", -- Keeps the blame subtle by matching your comments
	},
	keys = {
		{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
		{ "<leader>gO", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open Commit in Browser" },
	},
}
