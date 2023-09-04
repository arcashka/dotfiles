local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Vs Code Dark+ (Gogh)"
config.font_size = 15.0
config.font = wezterm.font("JetBrains Mono")
config.hide_tab_bar_if_only_one_tab = true
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"

return config
