return {
	"sainnhe/everforest",
	"nyoom-engineering/oxocarbon.nvim",
	"rebelot/kanagawa.nvim",
	"morhetz/gruvbox",
	"oxfist/night-owl.nvim",
	"AlexvZyl/nordic.nvim",
	"folke/tokyonight.nvim",
	{
		"decaycs/decay.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme decay-default]])
		end,
	},
	"catppuccin/nvim",
	"nordtheme/vim",
}
