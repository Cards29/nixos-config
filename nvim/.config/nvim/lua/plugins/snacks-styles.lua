return {
	"folke/snacks.nvim",
	opts = {

		styles = {
			notification = { border = "rounded", transparent = true },
			scratch = { border = "rounded", width = 0.8, height = 0.8 },
			lazygit = { border = "rounded", width = 0.9, height = 0.9 },
			terminal = {
				border = "rounded",
				position = "float",
				width = function(self)
					local pos = self.opts.position
					if pos == "right" then
						return 0.5
					elseif pos == "bottom" then
						return 1.0
					else
						return 0.95
					end
				end,
				height = function(self)
					local pos = self.opts.position
					if pos == "right" then
						return 1.0
					elseif pos == "bottom" then
						return 0.7
					else
						return 0.9
					end
				end,
			},
		},
	},
}
