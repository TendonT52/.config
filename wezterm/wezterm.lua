local wezterm = require("wezterm")

local config = wezterm.config_builder()
require("lua/tendont52/option").init(config)
require("lua/tendont52/tab").init(config)
require("lua/tendont52/keymap").init(config)

return config
