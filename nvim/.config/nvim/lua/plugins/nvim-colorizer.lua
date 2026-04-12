return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",

	config = function()
		require("colorizer").setup({
			options = {
				parsers = {
					css = true, -- preset: enables names, hex, rgb, hsl, oklch
					tailwind = { enable = true },
				},
				display = {
					mode = "virtualtext",
					virtualtext = { position = "after" },
				},
			},
		})
	end,
}
