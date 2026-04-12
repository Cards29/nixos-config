return {
	{
		"mbbill/undotree",
		config = function()
			-- Optional: Customize undotree settings
			vim.g.undotree_WindowLayout = 2 -- Sidebar on the right
			vim.g.undotree_ShortIndicators = 1 -- Shorter timestamps
			vim.g.undotree_SetFocusWhenToggle = 1 -- Focus undotree when opened
		end,
		keys = {
			{ "<leader>uu", "<cmd>UndotreeToggle<CR>", desc = "Undotree: Toggle" },
		},
	},
}
