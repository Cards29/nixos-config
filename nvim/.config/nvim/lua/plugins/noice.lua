return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		presets = {
			command_palette = true,     -- Floating cmdline
			bottom_search = true,       -- Search bar stays at bottom
			long_message_to_split = true, -- Long messages go to a split
			lsp_doc_border = true,      -- Adds borders to hover/signatures
		},
	},
	-- stylua: ignore
	keys = {
		{ "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
		{ "<c-f>", function() if not require("noice.lsp").scroll(4)  then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward",  mode = { "i", "n", "s" } },
		{ "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = { "i", "n", "s" } },
	},
	config = function(_, opts)
		-- Prevent noice from showing messages from before it was enabled
		-- when Lazy is installing plugins
		if vim.o.filetype == "lazy" then
			vim.cmd([[messages clear]])
		end
		require("noice").setup(opts)
	end,
}
