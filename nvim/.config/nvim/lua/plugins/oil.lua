return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Oil",
	keys = {
		{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Explorer (Oil float)" },
	},
	opts = {
		skip_confirm_for_simple_edits = true,
	},
	config = function(_, opts)
		require("oil").setup(opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "OilActionsPost",
			callback = function(event)
				if event.data.actions[1].type == "move" then
					Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
				end
			end,
		})
	end,
}
