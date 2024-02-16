local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>ee", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>11", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>22", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>33", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>44", function() ui.nav_file(4) end)
