return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "MaximilianLloyd/ascii.nvim", "MunifTanjim/nui.nvim" },
	opts = {
		dashboard = {
			enabled = false,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
			preset = {
				keys = {
					{
						icon = "",
						key = "f",
						desc = "Find File",
						action = ":lua Snacks.dashboard.pick('find_files')",
					},
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" }, --   = new file / document
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					}, --   = gear / config
					{
						icon = " ",
						key = "s",
						desc = "Restore Session",
						action = ":lua Snacks.dashboard.sections.session()",
					}, --   = restore / session (or use  /  )
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" }, -- 󰒲  = lazy (official Lazy icon)
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" }, --   = exit / quit
				},
			},
		},
	},
	keys = {
		{
			"<leader>bd",
			function()
				Snacks.dashboard.open()
			end,
			desc = "Open Dashboard",
		},
	},
}
