return {
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>u",
				vim.cmd.UndotreeToggle,
				desc = "Diagnostics (Trouble)",
			},
		},
	},
	"lervag/vimtex",
	"iamcco/markdown-preview.nvim",
	"nvim-pack/nvim-spectre",
	"lewis6991/gitsigns.nvim",
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	"luckasRanarison/tree-sitter-hyprlang",
	"nordtheme/vim",
	"karb94/neoscroll.nvim",
	"nanozuki/tabby.nvim",
	"ThePrimeagen/vim-be-good",
	"wakatime/vim-wakatime",
	"mhartington/formatter.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	"folke/trouble.nvim",
	"numToStr/Comment.nvim",
	"stevearc/dressing.nvim",
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"wbthomason/packer.nvim",
	"folke/tokyonight.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",
	"rafamadriz/friendly-snippets",
}
