local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.color_scheme = 'nord'
config.window_background_opacity = 0.8

config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'Fira Code Nerd Font',
}

config.font_size = 15
config.enable_tab_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.window_close_confirmation = 'NeverPrompt'
return config
