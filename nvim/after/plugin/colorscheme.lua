vim.cmd("colorscheme tokyonight-moon")
-- vim.cmd("colorscheme nord")
-- vim.cmd("colorscheme tokyonight-storm")
-- vim.cmd("colorscheme catppuccin-macchiato")
vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme nordic")
--
if vim.g.neovide ~= true then
    vim.cmd [[highlight Normal guibg=none]]
end

vim.wo.fillchars = 'eob: '
vim.cmd('highlight SignColumn guibg=transparent')
