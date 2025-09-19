local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	default_cursor_style = "SteadyBlock",
	force_reverse_video_cursor = false,
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	enable_tab_bar = true,
	font_size = 24,
	font = wezterm.font("MesloLGS Nerd Font Mono", { weight = "Bold" }),
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	background = {
		{
			source = {
				File = "/Users/" .. os.getenv("USER") .. "/.config/wezterm/frieren.jpg",
			},
			hsb = {
				hue = 1.0,
				saturation = 1.02,
				brightness = 1.00,
			},
			width = "100%",
			height = "100%",
		},
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.8,
		},
	},
	hyperlink_rules = {
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},
	},

	keys = {
		{
			key = ";",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "F13" }),
		},
		{
			key = "=",
			mods = "CMD",
			action = wezterm.action.IncreaseFontSize,
		},
		{
			key = "-",
			mods = "CMD",
			action = wezterm.action.DecreaseFontSize,
		},
		{
			key = "p",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "b", mods = "ALT" }),
		},
		{
			key = "n",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "f", mods = "ALT" }),
		},
		{
			key = "a",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
		},
		{
			key = "e",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "e", mods = "CTRL" }),
		},
		{
			key = "w",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "w", mods = "CTRL" }),
		},
		{
			key = "Backspace",
			mods = "ALT",
			action = wezterm.action.SendKey({ key = "Backspace", mods = "ALT" }),
		},
	},
	colors = {
		cursor_bg = "#ffffff",
		cursor_fg = "#282c35",
		cursor_border = "#ffffff",
	},
}
return config
