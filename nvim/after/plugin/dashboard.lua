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
                action = "lua require('auto-session.session-lens').search_session()",
                desc = " Find Session",
                icon = "",
                key = "s"
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
            limit = 8,
            icon = '',
            label = '\t Recent Project',
            action = 'LoadSession '
        },
    },
})
