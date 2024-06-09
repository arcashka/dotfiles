local wezterm = require("wezterm")
local config = {}

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Vs Code Dark+ (Gogh)"
	else
		return "Vs Code Light+ (Gogh)"
	end
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.font_size = 15.0
config.font = wezterm.font_with_fallback({
	"JetBrains Mono Nerd Font",
	"DengXian",
})
config.hide_tab_bar_if_only_one_tab = true
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
