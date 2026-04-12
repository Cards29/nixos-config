-- Plugin: abecodes/tabout.nvim
-- Installed via store.nvim

return {
	"abecodes/tabout.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = "InsertEnter",
	config = function()
		require("tabout").setup({
			tabkey = "<Tab>",
			backwards_tabkey = "<S-Tab>",
			act_as_tab = true,
			completion = false,
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
			},
			ignore_beginning = true,
			exclude = {},
		})
	end,
}

