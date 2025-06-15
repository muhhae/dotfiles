-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 		priority = 1000,
-- 		lazy = false,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		init = function()
-- 			vim.filetype.add({
-- 				extension = {
-- 					templ = "templ",
-- 					astro = "astro",
-- 					mdx = "mdx",
-- 				},
-- 			})
-- 		end,
-- 		opts = {
-- 			automatic_installation = true,
-- 			ensure_installed = {
-- 				"arduino_language_server",
-- 				"ast_grep",
-- 				"astro",
-- 				"clangd",
-- 				"cssls",
-- 				"gopls",
-- 				"html",
-- 				"htmx",
-- 				"jqls",
-- 				"jsonls",
-- 				"ltex",
-- 				"lua_ls",
-- 				"pylsp",
-- 				"ruff",
-- 				"rust_analyzer",
-- 				"tailwindcss",
-- 				"templ",
-- 				"texlab",
-- 				"ts_ls",
-- 				"yamlls",
-- 			},
-- 			handlers = {
-- 				html = function()
-- 					require("lspconfig").html.setup({
-- 						filetypes = { "html", "templ" },
-- 					})
-- 				end,
-- 				htmx = function()
-- 					require("lspconfig").htmx.setup({
-- 						filetypes = { "html", "templ" },
-- 					})
-- 				end,
-- 				tailwindcss = function()
-- 					require("lspconfig").tailwindcss.setup({
-- 						filetypes = { "templ", "astro", "javascript", "typescript", "react" },
-- 						init_options = { userLanguages = { templ = "html" } },
-- 					})
-- 				end,
-- 			},
-- 		},
-- 	},
-- }

-- lua/plugins/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"folke/neodev.nvim",
		},
		config = function()
			local servers = {
				"arduino_language_server",
				"ast_grep",
				"astro",
				"clangd",
				"cssls",
				"gopls",
				"html",
				"htmx",
				"jqls",
				"jsonls",
				"ltex",
				"lua_ls",
				"pylsp",
				"ruff",
				"rust_analyzer",
				"tailwindcss",
				"templ",
				"texlab",
				"ts_ls",
				"yamlls",
			}
			require("neodev").setup()
			local mason_lspconfig = require("mason-lspconfig")
			require("mason").setup()
			mason_lspconfig.setup({
				ensure_installed = servers,
			})
		end,
	},
}
