return {
	"folke/snacks.nvim",
	opts = {
		-- --- Search & Navigation ---
		picker = {
			enabled = true,

			formatters = {
				file = { filename_first = true },
			},

			sources = {
				explorer = {
					layout = {
						layout = {
							position = "right", -- This moves the explorer to the right
						},
					},
				},
			},

			win = {
				input = {
					keys = {
						["<a-s>"] = { "flash", mode = { "n", "i" } },
						["s"] = { "flash" },
					},
				},
			},

			actions = {
				flash = function(picker)
					require("flash").jump({
						pattern = "^",
						label = { after = { 0, 0 } },
						search = {
							mode = "search",
							exclude = {
								function(win)
									return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
								end,
							},
						},
						action = function(match)
							local idx = picker.list:row2idx(match.pos[1])
							picker.list:_move(idx, true, true)
						end,
					})
				end,
			},
		},
	},
	keys = {
		-- --- FILES & PROJECT ---
		-- {
		-- 	"<leader><space>",
		-- 	function()
		-- 		Snacks.picker.smart()
		-- 	end,
		-- 	desc = "Smart Find Files",
		-- },
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},

		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent files",
		},

		{
			"<leader>fa",
			function()
				Snacks.picker.files({ hidden = true, ignored = true, exclude = { ".git" } })
			end,
			desc = "All files (hidden + ignored)",
		},
		{
			"<leader>E",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},

		-- --- SEARCH ---
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fS",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},

		-- --- MISC PICKERS ---
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.marks()
			end,
			desc = "List marks",
		},
		{
			"<leader>fR",
			function()
				Snacks.picker.registers()
			end,
			desc = "List register",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker()
			end,
			desc = "All pickers",
		},
		{
			"<leader>fM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man pages",
		},
		{
			"<leader>fz",
			function()
				Snacks.picker.zoxide()
			end,
			desc = "Zoxide search",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Search keymaps",
		},
	},
}
