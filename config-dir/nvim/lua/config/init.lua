require("config.remap")
require("config.lazy")
require("config.set")
require("config.autocmd")

if vim.g.neovide == true then
	require("config.neovide")
end

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true

-- vim.opt.background = "light"
vim.opt.background = "dark"

-- if vim.g.neovide ~= true then
-- 	vim.cmd([[highlight Normal guibg=none]])
-- end

-- vim.cmd([[highlight Normal guibg=none]])

vim.wo.fillchars = "eob: "
vim.cmd("highlight SignColumn guibg=transparent")

vim.opt.cursorline = true -- Highlight the line the cursor is on
vim.opt.cursorlineopt = "number" -- Only highlight the line number, not the whole line
