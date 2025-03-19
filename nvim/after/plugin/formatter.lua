-- Utilities for creating configurations
local util = require("formatter.util")
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

AutoFormatEnabled = true

function ToggleAutoFormat()
	AutoFormatEnabled = not AutoFormatEnabled
end

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	desc = "Auto-format Files after saving",
	callback = function()
		if AutoFormatEnabled then
			vim.cmd("FormatWrite")
		end
	end,
})

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		java = { require("formatter.filetypes.java").google_java_format },
		dart = { require("formatter.filetypes.dart").dartformat },
		latex = { require("formatter.filetypes.latex").latexformat },
		python = { require("formatter.filetypes.python").ruff },
		lua = { require("formatter.filetypes.lua").stylua },
		go = {
			require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofumpt,
			require("formatter.filetypes.go").golines,
		},
		rust = { require("formatter.filetypes.rust").rustfmt },
		zsh = { require("formatter.filetypes.zsh").beautysh },
		sh = { require("formatter.filetypes.sh").shfmt },
		toml = { require("formatter.filetypes.toml").taplo },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		c = { require("formatter.filetypes.c").clangformat },

		markdown = { require("formatter.filetypes.markdown").prettierd },
		mdx = { require("formatter.filetypes.markdown").prettierd },
		css = { require("formatter.filetypes.css").prettierd },
		yaml = { require("formatter.filetypes.yaml").prettierd },

		json = { require("formatter.filetypes.json").biome },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
		templ = {
			function()
				return {
					exe = "templ fmt -stdout",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
		astro = { require("formatter.filetypes.javascript").prettier },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
