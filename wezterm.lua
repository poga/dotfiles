-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- For example, changing the color scheme:

config.font = wezterm.font("Operator Mono Lig", {weight="Book", stretch="Normal"})
config.color_scheme = 'Catppuccin Mocha'

config.font_size = 14.0

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
      key = 'k',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
      key = 'h',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
      key = 'j',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
      key = 'l',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Right',
  },
}
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5,
}

-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'
-- Sets the font for the window frame (tab bar)
config.window_frame = {
  -- Berkeley Mono for me again, though an idea could be to try a
  -- serif font here instead of monospace for a nicer look?
  font = wezterm.font({ family = 'Operator Mono Lig', weight = 'Book' }),
  font_size = 12,
}

config.line_height = 1.05
config.show_new_tab_button_in_tab_bar = false

-- and finally, return the configuration to wezterm
return config
