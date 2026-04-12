local color_util = require("util.color")
local default_colorscheme = color_util.get_saved()

return {
	{
		"sainnhe/everforest",
		priority = 1000,
		lazy = default_colorscheme ~= "everforest",
		config = function()
			vim.g.everforest_background = "soft"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_disable_italic_comment = 0
			vim.g.everforest_transparent_background = 0
			vim.g.everforest_ui_contrast = "low"
			vim.g.everforest_show_eob = 0
			vim.g.everforest_float_style = "dim"
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_line_highlight = 0
			vim.g.everforest_diagnostic_virtual_text = "grey"
			vim.g.everforest_current_word = "grey background"
		end,
	},

	{ "catppuccin/nvim", name = "catppuccin", lazy = default_colorscheme ~= "catppuccin" },
	{ "folke/tokyonight.nvim", lazy = default_colorscheme ~= "tokyonight" },
	{ "rebelot/kanagawa.nvim", lazy = default_colorscheme ~= "kanagawa" },
	{ "rose-pine/neovim", name = "rose-pine", lazy = default_colorscheme ~= "rose-pine" },
	{ "kaicataldo/material.vim", lazy = default_colorscheme ~= "material" },
	{ "oskarnurm/koda.nvim", lazy = default_colorscheme ~= "koda" },
	{ "mrpbennett/boo-berry.nvim", lazy = default_colorscheme ~= "boo-berry" },
	{ "WTFox/jellybeans.nvim", lazy = default_colorscheme ~= "jellybeans" },
	{ "webhooked/kanso.nvim", lazy = default_colorscheme ~= "kanso" },
	{ "0x-ximon/acario.nvim", lazy = default_colorscheme ~= "acario" },

	{
		-- applies the default colorscheme after the chosen plugin's config runs
		name = "default-colorscheme",
		dir = vim.fn.stdpath("config"),
		priority = 999,
		lazy = false,
		config = function()
			vim.cmd.colorscheme(default_colorscheme)
		end,
	},
}
