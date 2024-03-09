local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "hide tilde ~",
	callback = function()
		-- print("Hiding tilde ~, go to autocmd.lua to disable")
		vim.wo.fillchars = "eob: "
		vim.cmd("highlight SignColumn guibg=transparent")
	end,
	group = autocmd_group,
})
