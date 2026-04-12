return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = true,

	cmd = "FzfLua",

	keys = {
		{
			"<leader>fF",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files (fzf alt)",
		},
	},

	opts = {
		winopts = {
			preview = {
				layout = "flex",
			},
		},
		keymap = {
			fzf = {
				["ctrl-k"] = "up",
				["ctrl-j"] = "down",
				["ctrl-q"] = "select-all+accept",
			},
		},
		files = {
			formatter = "path.filename_first",
		},
	},

	config = function(_, opts)
		require("fzf-lua").setup(opts)
	end,
}
