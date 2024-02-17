-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night Moon'
config.font = wezterm.font_with_fallback {
  'JetBrainsMono Nerd Font',
  'Fira Code Nerd Font',
}
config.font_size = 14
config.enable_tab_bar = false
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom =8,
}
config.window_close_confirmation = 'NeverPrompt'
return config
