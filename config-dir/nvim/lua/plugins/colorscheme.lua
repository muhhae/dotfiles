local colorscheme = {
	-- tokyonight
	{ "folke/tokyonight.nvim", "tokyonight-night" },
	{ "folke/tokyonight.nvim", "tokyonight-moon" },
	{ "folke/tokyonight.nvim", "tokyonight-storm" },
	{ "folke/tokyonight.nvim", "tokyonight-day" },

	-- kanagawa
	{ "rebelot/kanagawa.nvim", "kanagawa-wave" },
	{ "rebelot/kanagawa.nvim", "kanagawa-dragon" },
	{ "rebelot/kanagawa.nvim", "kanagawa-lotus" }, -- not in your list but supported

	-- everforest
	{ "sainnhe/everforest", "everforest" }, -- set background separately

	-- oxocarbon
	{ "nyoom-engineering/oxocarbon.nvim", "oxocarbon" },

	-- gruvbox
	{ "morhetz/gruvbox", "gruvbox" }, -- set background to "dark" or "light"

	-- night-owl
	{ "oxfist/night-owl.nvim", "night-owl" },

	-- nordic
	{ "AlexvZyl/nordic.nvim", "nordic" },

	-- decay
	{ "decaycs/decay.nvim", "decay-dark" },
	{ "decaycs/decay.nvim", "decay-default" },
	{ "decaycs/decay.nvim", "decayce" },

	-- catppuccin
	{ "catppuccin/nvim", "catppuccin-mocha" },
	{ "catppuccin/nvim", "catppuccin-macchiato" },
	{ "catppuccin/nvim", "catppuccin-frappe" },
	{ "catppuccin/nvim", "catppuccin-latte" },

	-- nord
	{ "nordtheme/vim", "nord" },
}

if not vim.g.COLORMODE then
	vim.g.COLORMODE = "dark"
end

if not vim.g.COLORSCHEMEI or vim.g.COLORSCHEMEI <= 0 then
	vim.g.COLORSCHEMEI = 1
end

if not vim.g.TRANSPARENT then
	vim.g.TRANSPARENT = false
end

local colorscheme_mod = {}

for _, v in ipairs(colorscheme) do
	local exist = false
	for _, x in ipairs(colorscheme_mod) do
		if v[1] == x[1] then
			exist = true
			break
		end
	end
	if not exist then
		table.insert(colorscheme_mod, v[1])
	end
end

colorscheme_mod[vim.g.COLORSCHEMEI] = {
	colorscheme_mod[vim.g.COLORSCHEMEI],
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.background = vim.g.COLORMODE

		-- if vim.g.neovide ~= true then
		-- 	vim.cmd([[highlight Normal guibg=none]])
		-- end

		-- vim.cmd([[highlight Normal guibg=none]])

		vim.cmd("highlight clear")
		vim.cmd("colorscheme " .. colorscheme[vim.g.COLORSCHEMEI][2])
		if vim.g.TRANSPARENT == true then
			-- Make both active and inactive windows transparent
			vim.cmd([[
                highlight Normal guibg=NONE ctermbg=NONE
                highlight NormalNC guibg=NONE ctermbg=NONE
            ]])
		end
	end,
	keys = {
		{
			"<leader>ct",
			function()
				vim.cmd("highlight clear")
				vim.cmd("colorscheme " .. colorscheme[vim.g.COLORSCHEMEI][2])
				vim.g.TRANSPARENT = not vim.g.TRANSPARENT
				-- print("Transparent :" .. string(vim.g.TRANSPARENT))
				if vim.g.TRANSPARENT == true then
					print("Transparent")
					vim.cmd([[
                        highlight Normal guibg=NONE ctermbg=NONE
                        highlight NormalNC guibg=NONE ctermbg=NONE
                    ]])
				else
					print("Not Transparent")
				end
			end,
			desc = "Toggle Transparent",
		},
		{
			"<leader>cc",
			function()
				vim.cmd("CustomColorscheme")
			end,
			desc = "Pick Colorscheme (with preview)",
		},
		{
			"<leader>cm",
			function()
				vim.cmd("ToggleColormode")
			end,
			desc = "Switch Colormode",
		},
	},
	init = function()
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local conf = require("telescope.config").values
		local previewers = require("telescope.previewers")

		local function colorscheme_picker()
			pickers
				.new({}, {
					prompt_title = "Custom Colorschemes",
					finder = finders.new_table({
						results = colorscheme,
						entry_maker = function(entry)
							return {
								value = entry,
								display = entry[2],
								ordinal = entry[2],
							}
						end,
					}),
					default_selection_index = vim.g.COLORSCHEMEI,
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, map)
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)
							local selection = action_state.get_selected_entry().value
							for index, value in ipairs(colorscheme) do
								if value[1] == selection[1] and value[2] == selection[2] then
									vim.g.COLORSCHEMEI = index
									print("Colorscheme changed: " .. value[2])
									break
								end
							end
						end)
						return true
					end,
					previewer = previewers.new_buffer_previewer({
						define_preview = function(self, entry, _)
							if entry and entry.value then
								vim.cmd("highlight clear")
								vim.opt.background = vim.g.COLORMODE
								vim.cmd("colorscheme " .. entry.value[2])
								if vim.g.TRANSPARENT == true then
									vim.cmd([[
                                        highlight Normal guibg=NONE ctermbg=NONE
                                        highlight NormalNC guibg=NONE ctermbg=NONE
                                    ]])
								end
							end
						end,
					}),
					layout_strategy = "flex",
					layout_config = {
						height = 0.4,
						width = 0.3,
						anchor = "SE", -- N, NE, E, SE, S, SW, W, NW, CENTER
					},
				})
				:find()
		end

		-- Create command for it
		vim.api.nvim_create_user_command("CustomColorscheme", colorscheme_picker, {})
		vim.api.nvim_create_user_command("ToggleColormode", function()
			if vim.g.COLORMODE == "dark" then
				vim.g.COLORMODE = "light"
			else
				vim.g.COLORMODE = "dark"
			end
			print("Current mode: " .. vim.g.COLORMODE)
			vim.cmd("highlight clear")
			vim.opt.background = vim.g.COLORMODE
			vim.cmd("colorscheme " .. colorscheme[vim.g.COLORSCHEMEI][2])
			if vim.g.TRANSPARENT == true then
				vim.cmd([[
                    highlight Normal guibg=NONE ctermbg=NONE
                    highlight NormalNC guibg=NONE ctermbg=NONE
                ]])
			end
		end, {})
	end,
}

return colorscheme_mod
