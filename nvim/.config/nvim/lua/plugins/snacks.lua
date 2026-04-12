return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- --- UI & Aesthetics ---
		animate = { enabled = true }, -- Smooth animations for cursor movement and scrolling
		indent = { enabled = true }, -- Modern indent guides with scope detection
		notifier = { enabled = true, timeout = 3000 }, -- Pretty notification UI (replaces default)
		notify = { enabled = true }, -- Wraps vim.notify to use the snacks notifier
		scroll = { enabled = true }, -- Smooth scrolling animations
		statuscolumn = { enabled = true }, -- Custom status column with signs, numbers, and folds
		image = { enabled = true }, -- Uses the kitty stuff

		-- --- File & Buffer Management ---
		bigfile = { enabled = true }, -- Optimizes performance when opening very large files
		bufdelete = { enabled = true }, -- Delete buffers without disrupting your window layout
		quickfile = { enabled = true }, -- Faster file opening by bypassing heavy autocmds
		rename = { enabled = true }, -- LSP-integrated file renaming with UI
		win = { enabled = true }, -- High-performance window management and API
		explorar = { enabled = true }, -- Explorar

		-- --- Search & Navigation ---
		scope = { enabled = true }, -- Scope-based logic for navigation and highlighting
		words = { enabled = true }, -- Highlights and allows jumping between LSP references of the word under cursor

		-- --- Dashboard ---
		dashboard = { enabled = false }, -- Snacks dashboard

		-- --- Productivity & Utils ---
		keymap = { enabled = true }, -- Helpful metadata and utilities for keybindings
		layout = { enabled = true }, -- Advanced window layout manager for pickers and UI
		scratch = { enabled = true }, -- Instant scratch buffers for notes or temporary code
		toggle = { enabled = true }, -- API to create toggles for settings (indent, wrap, etc.)
	},
}
