local presence = require("presence")

presence.setup({
	auto_update = true,
	-- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
	neovim_image_text = "The One True Text Editor",
	main_image = "file",
	-- Main image display (either "neovim" or "file")
	log_level = nil,
	-- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
	debounce_timeout = 10,
	-- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
	enable_line_number = false,
	-- Displays the current line number instead of the current project
	blacklist = {},
	-- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
	buttons = true,
	-- Configure Rich Presence button(s), either a boolean to enable/disable,
	-- a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
	file_assets = {
		templ = { "Templ", "https://cdn.icon-icons.com/icons2/2699/PNG/512/golang_logo_icon_171073.png" },
		go = { "Go", "https://cdn.icon-icons.com/icons2/2699/PNG/512/golang_logo_icon_171073.png" },
	},
	show_time = true,
	editing_text = "Messing with %s",
	file_explorer_text = "Looking for a file to mess with",
	git_commit_text = "Committing some crime (changes)",
	plugin_manager_text = "Managing plugins",
	reading_text = "Reading %s",
	workspace_text = "Working on %s",
	line_number_text = "Line %s out of %s",
})
