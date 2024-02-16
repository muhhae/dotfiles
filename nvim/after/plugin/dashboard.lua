local db = require("dashboard")
db.setup({
    theme = 'hyper',
    disable_move = true,
    shortcut_type = 'number',
    hide = {
        statusline = false,
    },
    config = {
        -- header = vim.split(logo, "\n"),
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
                action = 'lua require("persistence").load()',
                desc = " Restore Session",
                icon = " ",
                key = "s"
            },
            {
                icon = "󰩈 ",
                key = "q",
                action = "qa",
                desc = " Quit",
            }
        },
    },
})
