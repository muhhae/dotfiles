local lsp_zero = require("lsp-zero")
vim.filetype.add({
	extension = {
		templ = "templ",
		astro = "astro",
		mdx = "mdx",
	},
})

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

local lspconfig = require("lspconfig")

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		priority = 1000,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
			ensure_installed = {
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
			},
			handlers = {
				lsp_zero.default_setup,
				html = function()
					lspconfig.html.setup({
						filetypes = { "html", "templ" },
					})
				end,
				htmx = function()
					lspconfig.htmx.setup({
						filetypes = { "html", "templ" },
					})
				end,
				tailwindcss = function()
					lspconfig.tailwindcss.setup({
						filetypes = { "templ", "astro", "javascript", "typescript", "react" },
						init_options = { userLanguages = { templ = "html" } },
					})
				end,
			},
		},
	},
}
