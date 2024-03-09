local lsp_zero = require("lsp-zero")
vim.filetype.add({
	extension = {
		templ = "templ",
		astro = "astro",
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
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
		"clangd",
		"tsserver",
		"svelte",
		"graphql",
		"lua_ls",
		"gopls",
		"arduino_language_server",
		"kotlin_language_server",
		"cssls",
		"ltex",
		"vimls",
		"html",
		"jqls",
		"pylsp",
		"htmx",
		"tailwindcss",
		"jsonls",
		"yamlls",
		"templ",
		"astro",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local runtime_path = vim.split(package.path, ";")
			table.insert(runtime_path, "lua/?/init.lua")
			table.insert(runtime_path, "lua/?.lua")

			local plugin_path = {
				"/home/muhhae/.local/share/nvim/site/pack/packer/start",
				"/home/muhhae/.local/share/nvim/site/pack/packer/opt",
			}

			local vim_runtime = vim.fn.expand("$VIMRUNTIME/lua")
			local vim_config = vim.fn.stdpath("config") .. "/lua"
			print(vim.fn.stdpath("data"))

			local lib = {
				"/home/muhhae/.local/share/nvim/site/pack/packer/start",
				"/home/muhhae/.local/share/nvim/site/pack/packer/opt",
			}
			for _, path in ipairs(plugin_path) do
				table.insert(lib, path .. "/?/lua/?")
				table.insert(lib, path .. "/?.nvim/lua/?")
				table.insert(lib, path .. "/?-nvim/lua/?")
			end

			table.insert(lib, vim_runtime)
			table.insert(lib, vim_config)

			local lua_conf = {
				settings = {
					Lua = {
						telemetry = { enable = false },
						runtime = {
							version = "LuaJIT",
							path = runtime_path,
							pathStrict = true,
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = true,
							library = lib,
						},
					},
				},
			}

			lspconfig.lua_ls.setup(lua_conf)
		end,
		tsserver = function()
			lspconfig.tsserver.setup({
				single_file_support = true,
			})
		end,
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
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<Enter>"] = cmp.mapping.confirm(),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})
