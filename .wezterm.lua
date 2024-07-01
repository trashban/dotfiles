-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_padding = {
  left = '0',
  right = '0',
  top = '0',
  bottom = '0',
}
config.font_size=20.0
config.enable_tab_bar=false
config.color_scheme = 'astromouse'
enable_scroll_bar=false
config.window_background_opacity = 0.75
config.font = wezterm.font 'SauceCodePro Nerd Font Mono'

-- and finally, return the configuration to wezterm
return config
