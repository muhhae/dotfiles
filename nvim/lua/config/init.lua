require("config.remap")
require("config.packer")
require("config.set")
require("config.autocmd")

if vim.g.neovide == true then
	require("config.neovide")
end

vim.opt.smartcase = true
vim.opt.ignorecase = true
