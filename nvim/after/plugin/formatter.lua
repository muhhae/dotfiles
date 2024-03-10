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

local function prettier(...)
	local default_args = {
		"--tab-width 4",
		util.escape_path(util.get_current_buffer_file_path()),
	}

	for _, v in ipairs(arg) do
		table.insert(default_args, v)
	end

	return function()
		return {
			exe = "prettier",
			args = default_args,
			stdin = true,
		}
	end
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		python = { require("formatter.filetypes.python").black },
		lua = { require("formatter.filetypes.lua").stylua },
		go = {
			require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofumpt,
		},
		rust = { require("formatter.filetypes.rust").rustfmt },
		zsh = { require("formatter.filetypes.zsh").beautysh },
		sh = { require("formatter.filetypes.sh").shfmt },
		toml = { require("formatter.filetypes.toml").taplo },
		cpp = { require("formatter.filetypes.cpp").uncrustify },
		c = { require("formatter.filetypes.c").uncrustify },

		markdown = { prettier() },
		mdx = { prettier() },
		css = { prettier() },
		json = { prettier() },
		yaml = { prettier() },
		javascript = { prettier() },
		javascriptreact = { prettier() },
		typescript = { prettier() },
		typescriptreact = { prettier() },
		astro = { prettier("--plugin prettier-plugin-astro") },
		mjs = { prettier() },

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
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
