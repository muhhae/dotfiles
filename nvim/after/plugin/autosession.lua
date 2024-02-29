require("auto-session").setup {
    auto_session_suppress_dirs = { "~/", "/" },
}

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

vim.api.nvim_create_user_command('LoadSession', function(opts)
    local path = opts.fargs[1]
    local data_path = vim.fn.stdpath('data') .. "/sessions/"
    local session_path = data_path .. path:gsub("/", "%%") .. '.vim'
    vim.cmd('cd ' .. path)
    if file_exists(session_path) then
        vim.cmd('SessionRestore')
    else
        vim.cmd("Telescope find_files")
    end
end, { nargs = 1 })

vim.keymap.set("n", "<C-S-S>", require("auto-session.session-lens").search_session, {
    noremap = true,
})
