-- Plugin: andweeb/presence.nvim
-- Installed via store.nvim

return {
	"andweeb/presence.nvim",
	event = "VeryLazy",
	opts = {
		-- General options
		auto_update = true,
		neovim_image_text = "I hate Javascript", -- Text when hovering over the Neovim logo
		main_image = "neovim", -- Can be "neovim" or "file"
		client_id = "793271441293967371", -- Use the default Discord application ID
		log_level = nil, -- Set to "debug" if you have issues with Vesktop
		debounce_timeout = 10, -- Seconds between status updates

		-- Rich Presence text options (Customized for a clean look)
		editing_text = "Editing %s",
		file_explorer_text = "Browsing files",
		git_commit_text = "Committing changes",
		plugin_manager_text = "Managing plugins",
		reading_text = "Reading %s",
		workspace_text = "Working on %s", -- Shows your project folder name
		show_time = true, -- Shows how long you've been in the file

		-- Privacy & Blacklist
		-- This prevents Discord from showing these specific files/folders
		blacklist = {
			"%.env$", -- Hide environment variables
			"/%.ssh/.*", -- Hide SSH configs
			"sudoedit", -- Hide system files being edited with sudo
			"vault/.*", -- Hide anything in a 'vault' folder
		},

		buttons = true, -- Adds a button to your Discord profile that points to the plugin
	},
}
