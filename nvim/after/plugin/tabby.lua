local tabby = require("tabby")
tabby.setup()
require("tabby.tabline").use_preset("active_wins_at_tail")

for i = 1, 9 do
	vim.keymap.set("n", "<leader>t" .. i, "<cmd>tabnext " .. i .. "<CR>")
end

vim.keymap.set("n", "<M-s>", "<cmd>+tabmove<CR>")
vim.keymap.set("n", "<M-a>", "<cmd>-tabmove<CR>")

local theme = {
	fill = "TabLineFill",
	head = "TabLine",
	current_tab = "TabLineSel",
	tab = "TabLine",
	win = "TabLine",
	tail = "TabLine",
}
require("tabby.tabline").set(function(line)
	return {
		{
			{ "  ", hl = theme.head },
			line.sep("", theme.head, theme.fill),
		},
		line.tabs().foreach(function(tab)
			local hl = tab.is_current() and theme.current_tab or theme.tab
			return {
				line.sep("", theme.win, theme.fill),
				tab.is_current() and "" or "󰆣",
				tab.number(),
				tab.name(),
				tab.close_btn(""),
				line.sep("", theme.win, theme.fill),
				hl = theme.win,
				margin = " ",
			}
		end),
		line.spacer(),
		line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
			return {
				line.sep("", theme.win, theme.fill),
				win.is_current() and "" or "",
				win.buf_name(),
				line.sep("", theme.win, theme.fill),
				hl = theme.win,
				margin = " ",
			}
		end),
		{
			line.sep("", theme.tail, theme.fill),
			{ "  ", hl = theme.tail },
		},
		hl = theme.fill,
	}
end)

vim.o.showtabline = 2
