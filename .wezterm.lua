-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.enable_tab_bar=false
config.window_decorations="RESIZE"
config.font_size=14
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
-- For example, changing the color scheme:

-- and finally, return the configuration to wezterm
return config

