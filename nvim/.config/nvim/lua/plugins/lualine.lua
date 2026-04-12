return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true, -- LazyVim uses a single statusline at the bottom
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1 }, -- 1 = relative path
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
					},
				},
				lualine_x = {
					-- LazyVim often puts 'noice' or 'lazy' status here
					-- This is a standard 'diff' component
					{
						-- We call the function directly here
						function()
							return require("lazy.status").updates()
						end,
						-- We check if updates exist before showing it
						cond = function()
							return require("lazy.status").has_updates()
						end,
						color = { fg = "#ff9e64" },
					},
					-- {
					-- 	"diff",
					-- 	symbols = {
					-- 		added = " ",
					-- 		modified = " ",
					-- 		removed = " ",
					-- 	},
					-- },
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { color = "#ff9e64" }, -- Optional: pick a standout color
					},
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#7aa2f7" }, -- Blue-ish color to distinguish from macros
					},
					--
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
		})
	end,
}
