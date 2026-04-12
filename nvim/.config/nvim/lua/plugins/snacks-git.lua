return {
	"folke/snacks.nvim",
	opts = {
		-- --- Git Integration ---
		gh = { enabled = true }, -- GitHub-specific extensions
		git = { enabled = true }, -- General Git utilities (blame, etc.)
		gitbrowse = { enabled = true }, -- Open in browser (GitHub/GitLab)
		lazygit = { configure = true }, -- Lazygit terminal UI integration
	},
	keys = {
		-- --- 1. THE TERMINAL UI (Full Management) ---
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gL",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log",
		},

		-- --- 2. NAVIGATION & SEARCH ---
		{
			"<leader>gf",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Git Files",
		},
		{
			"<leader>g/",
			function()
				Snacks.picker.git_grep()
			end,
			desc = "Git Grep",
		},

		-- --- 3. STATUS & HISTORY (Pickers) ---
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		-- {
		-- 	"<leader>gd",
		-- 	function()
		-- 		Snacks.picker.git_diff()
		-- 	end,
		-- 	desc = "Git Diff",
		-- },
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log (Project)",
		},
		{
			"<leader>gh",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git File History",
		},

		-- --- 4. BLAME & BRANCHES ---
		{
			"<leader>gB",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches (Checkout)",
		},

		-- --- 5. REMOTE & GITHUB ---
		{
			"<leader>go",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse (Open)",
			mode = { "n", "v" },
		},
		{
			"<leader>gy",
			function()
				Snacks.gitbrowse({
					open = function(url)
						vim.fn.setreg("+", url)
					end,
					notify = false,
				})
			end,
			desc = "Copy GitHub URL",
			mode = { "n", "v" },
		},
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub PRs",
		},
	},
}
