local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.color_scheme = 'nord'
config.window_background_opacity = 0.7

config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'Fira Code Nerd Font',
}
config.default_cursor_style = 'SteadyBar'
config.font_size = 15
config.enable_tab_bar = false
config.window_padding = {
    left = 6,
    right = 6,
    top = 6,
    bottom = 6,
}

config.window_close_confirmation = 'NeverPrompt'
return config
