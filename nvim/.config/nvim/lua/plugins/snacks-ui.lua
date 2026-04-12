return {
	"folke/snacks.nvim",
	keys = {
		-- --- SCRATCH & NOTES ---
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},

		-- --- UI TOGGLES ---
		{
			"<leader>ui",
			function()
				Snacks.toggle.indent():toggle()
			end,
			desc = "Toggle Indent Guides",
		},
		{
			"<leader>un",
			function()
				Snacks.toggle.line_number():toggle()
			end,
			desc = "Toggle Line Numbers",
		},
		{
			"<leader>ua",
			function()
				Snacks.toggle.animate():toggle()
			end,
			desc = "Toggle Animation",
		},
		{
			"<leader>ud",
			function()
				Snacks.toggle.diagnostics():toggle()
			end,
			desc = "Toggle Diagnostics",
		},
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},

		-- --- NAVIGATION ---
		{
			"]]",
			function()
				Snacks.words.jump(1, true)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-1, true)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
	},
}
