require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"go",
		"svelte",
		"cpp",
		"python",
		"javascript",
		"typescript",
		"html",
		"templ",
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

vim.treesitter.language.register("markdown", "mdx")
