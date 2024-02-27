vim.o.guifont = "JetBrainsMono Nerd Font:h15"

vim.keymap.set('n', '<C-S-V>', '"+p')    -- Paste normal mode
vim.keymap.set('v', '<C-S-V>', '"+p')    -- Paste visual mode
vim.keymap.set('c', '<C-S-V>', '<C-R>+') -- Paste command mode
vim.keymap.set('i', '<C-S-V>', '<C-R>+') -- Paste command mode

vim.g.neovide_padding_top = 8
vim.g.neovide_padding_bottom = 8
vim.g.neovide_padding_right = 8
vim.g.neovide_padding_left = 8

vim.g.neovide_transparency = 0.8

vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
