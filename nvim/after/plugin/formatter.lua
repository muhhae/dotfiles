-- Utilities for creating configurations
local util = require("formatter.util")
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	desc = "Auto-format Files after saving",
	callback = function()
		vim.cmd("FormatWrite")
	end,
})

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		python = { require("formatter.filetypes.python").black },
		lua = { require("formatter.filetypes.lua").stylua },
		go = { require("formatter.filetypes.go").goimports },
		rust = { require("formatter.filetypes.rust").rustfmt },
		templ = {
			function()
				return {
					exe = "templ fmt",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
		astro = {
			function()
				return {
					exe = "prettier",
					args = {
						"--plugin prettier-plugin-astro",
						"--tab-width 4",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
