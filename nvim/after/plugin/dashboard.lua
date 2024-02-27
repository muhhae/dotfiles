local db = require("dashboard")
local ascii = require 'ascii'
local logo = ascii.art.text.neovim.bloody
db.setup({
    theme = 'hyper',
    disable_move = true,
    shortcut_type = 'number',
    hide = {
        statusline = false,
    },
    config = {
        header = logo,
        week_header = {
            enable = false,
        },
        shortcut = {
            {
                icon = " ",
                desc = 'Packer Sync',
                key = 'p',
                action = 'PackerSync',
            },
            {
                action = "Telescope find_files",
                desc = " Find file",
                icon = " ",
                key = "f"
            },
            {
                action = "ene | startinsert",
                desc = " New file",
                icon = " ",
                key = "n"
            },
            {
                action = "Telescope oldfiles",
                desc = " Recent files",
                icon = " ",
                key = "r"
            },
            {
                action = "Telescope live_grep",
                desc = " Find text",
                icon = " ",
                key = "g"
            },
            {
                icon = "󰩈 ",
                key = "q",
                action = "qa",
                desc = " Quit",
            }
        },
        project = {
            enable = true,
            limit = 16,
            icon = '',
            label = '\t Recent Project',
            action = 'LoadSession '
        },
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
