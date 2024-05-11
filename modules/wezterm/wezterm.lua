local wezterm = require "wezterm"

local config = wezterm.config_builder()

config.enable_wayland = false

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font "FiraCode Nerd Font"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.disable_default_key_bindings = true
config.keys = {
  {
    key = "c",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CopyTo "Clipboard"
  },
  {
    key = "v",
    mods = "CTRL|SHIFT",
    action = wezterm.action.PasteFrom "Clipboard"
  },
  {
    key = "Enter",
    mods = "ALT",
    action = wezterm.action.SpawnTab "DefaultDomain"
  },
  {
    key = "q",
    mods = "ALT",
    action = wezterm.action.CloseCurrentTab { confirm = true }
  },
  {
    key = "q",
    mods = "ALT|SHIFT",
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
    key = "h",
    mods = "ALT|SHIFT",
    action = wezterm.action.SplitPane {
      direction = "Left"
    }
  },
  {
    key = "j",
    mods = "ALT|SHIFT",
    action = wezterm.action.SplitPane {
      direction = "Down"
    }
  },
  {
    key = "k",
    mods = "ALT|SHIFT",
    action = wezterm.action.SplitPane {
      direction = "Up"
    }
  },
  {
    key = "l",
    mods = "ALT|SHIFT",
    action = wezterm.action.SplitPane {
      direction = "Right"
    }
  },
  {
    key = "h",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Left"
  },
  {
    key = "j",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Down"
  },
  {
    key = "k",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Up"
  },
  {
    key = "l",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Right"
  },
  {
    key = "LeftArrow",
    mods = "ALT",
    action = wezterm.action.AdjustPaneSize { "Left", 1 }
  },
  {
    key = "DownArrow",
    mods = "ALT",
    action = wezterm.action.AdjustPaneSize { "Down", 1 }
  },{
    key = "UpArrow",
    mods = "ALT",
    action = wezterm.action.AdjustPaneSize { "Up", 1 }
  },{
    key = "RightArrow",
    mods = "ALT",
    action = wezterm.action.AdjustPaneSize { "Right", 1 }
  },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = wezterm.action.ActivateTab(i - 1)
  })
end

return config
