return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	keys = {
		{
			"<leader>vcs",
			function()
				vim.cmd("Telescope lsp_document_symbols")
			end,
			desc = "Show documents symbols",
		},
		{
			"<leader>vcw",
			function()
				vim.cmd("Telescope lsp_workspace_symbols")
			end,
			desc = "Show workspace symbols",
		},
	},
	init = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
		vim.keymap.set("n", "<leader>gr", function()
			builtin.grep_string({ search = vim.fn.input("󰱼 ") })
		end, { desc = "Grep String" })
		vim.keymap.set("n", "T", ":Telescope ", { desc = "Open Telescope" })
		require("telescope").load_extension("ascii")
	end,
}
