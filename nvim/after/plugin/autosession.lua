require("auto-session").setup({
	auto_session_suppress_dirs = { "~/", "/" },
	cwd_change_handling = false,
	pre_cwd_changed_cmds = {
		-- "tabdo NERDTreeClose" -- Close NERDTree before saving session
	},
	bypass_save_filetypes = {
		"alpha",
		"dashboard",
	},
	post_cwd_changed_cmds = {
		function()
			require("lualine").refresh() -- example refreshing the lualine status line _after_ the cwd changes
			vim.cmd("SessionRestore")
		end,
	},
})

local function file_exists(filename)
	local ok, err, code = os.rename(filename, filename)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

vim.api.nvim_create_user_command("LoadSession", function(opts)
	local path = opts.fargs[1]
	local data_path = vim.fn.stdpath("data") .. "/sessions/"
	local session_path = data_path .. path:gsub("/", "%%") .. ".vim"
	vim.cmd("cd " .. path)
	if file_exists(session_path) then
		vim.cmd("SessionRestore")
	else
		vim.cmd("Neotree")
	end
end, { nargs = 1 })

vim.keymap.set("n", "<C-s>", ":SessionSearch<CR>")

-- vim.keymap.set("n", "<C-r>", ":SessionRestore<CR>", {
-- 	noremap = true,
-- })
