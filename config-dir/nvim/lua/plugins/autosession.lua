return {
	"rmagatti/auto-session",
	init = function()
		vim.api.nvim_create_user_command("LoadSession", function(opts)
			local path = opts.fargs[1]
			vim.cmd("cd " .. path)
			vim.cmd("SessionRestore")
		end, { nargs = 1 })

		vim.keymap.set("n", "<C-s>", "<CMD>SessionSearch<CR>")
	end,
	opts = {
		auto_session_suppress_dirs = { "~/", "/" },
		cwd_change_handling = true,
		pre_cwd_changed_cmds = {
			-- "tabdo Neotree close", -- Close Neotree before saving session
		},
		bypass_save_filetypes = {
			"alpha",
			"dashboard",
			"neotree",
			"harpoon",
		},
		post_cwd_changed_cmds = {
			function()
				require("lualine").refresh() -- example refreshing the lualine status line _after_ the cwd changes
				vim.cmd("SessionRestore")
			end,
		},
		enabled = true, -- Enables/disables auto creating, saving and restoring
		auto_save = true, -- Enables/disables auto saving session on exit
		auto_restore = true, -- Enables/disables auto restoring session on start
		auto_create = true, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
		auto_restore_last_session = vim.loop.cwd() == vim.loop.os_homedir(), -- On startup, loads the last saved session if session for cwd does not exist
		use_git_branch = false, -- Include git branch name in session name
		lazy_support = true, -- Automatically detect if Lazy.nvim is being used and wait until Lazy is done to make sure session is restored correctly. Does nothing if Lazy isn't being used. Can be disabled if a problem is suspected or for debugging
		close_unsupported_windows = true, -- Close windows that aren't backed by normal file before autosaving a session
		args_allow_single_directory = true, -- Follow normal session save/load logic if launched with a single directory as the only argument
		args_allow_files_auto_save = false, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. While you can just set this to true, you probably want to set it to a function that decides when to save a session when launched with file args. See documentation for more detail
		continue_restore_on_error = true, -- Keep loading the session even if there's an error
		show_auto_restore_notif = true, -- Whether to show a notification when auto-restoring
		lsp_stop_on_restore = false, -- Should language servers be stopped when restoring a session. Can also be a function that will be called if set. Not called on autorestore from startup
		log_level = "error", -- Sets the log level of the plugin (debug, info, warn, error).

		session_lens = {
			load_on_setup = true, -- Initialize on startup (requires Telescope)
			theme_conf = { -- Pass through for Telescope theme options
				-- layout_config = { -- As one example, can change width/height of picker
				--   width = 0.8,-- percent of window
				--   height = 0.5,
				-- },
			},
			previewer = false, -- File preview for session picker

			mappings = {
				-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
				delete_session = { "i", "<C-D>" },
				alternate_session = { "i", "<C-S>" },
				copy_session = { "i", "<C-Y>" },
			},

			session_control = {
				control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
				control_filename = "session_control.json", -- File name of the session control file
			},
		},
	},
}
