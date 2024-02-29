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
                action = "lua require('auto-session.session-lens').search_session()",
                desc = " Find Session",
                icon = "",
                key = "s"
            },
            {
                action = "Neotree ~/dotfiles/",
                desc = " Dotfiles",
                icon = " ",
                key = "d"
            },
            {
                action = "Neotree ~/personal/",
                desc = " Personal",
                icon = " ",
                key = "p"
            },
            {
                action = "Telescope find_files",
                desc = " Find file",
                icon = " ",
                key = "f"
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
            label = '\tRecent Project',
            action = 'LoadSession '
        },
    },
})
