vim.o.guifont = "IosevkaTerm Nerd Font:h14"

vim.g.neovide_padding_top = 8
vim.g.neovide_padding_bottom = 8
vim.g.neovide_padding_right = 8
vim.g.neovide_padding_left = 8

vim.g.neovide_transparency = 0.6
vim.g.neovide_scroll_animation_length = 0.05
vim.g.neovide_cursor_animation_length = 0.01
vim.g.neovide_cursor_vfx_mode = "wireframe"
vim.g.neovide_refresh_rate = 144

vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
	change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
	change_scale_factor(1 / 1.25)
end)

vim.keymap.set("n", "<C-+>", function()
	local current = vim.g.neovide_transparency
	vim.g.neovide_transparency = current + 0.025
	if vim.g.neovide_transparency >= 1 then
		vim.g.neovide_transparency = 1
	end
end)
vim.keymap.set("n", "<C-_>", function()
	local current = vim.g.neovide_transparency
	vim.g.neovide_transparency = current - 0.025
	if vim.g.neovide_transparency <= 0 then
		vim.g.neovide_transparency = 0
	end
end)
