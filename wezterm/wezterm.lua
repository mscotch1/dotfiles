local wezterm = require 'wezterm'

return {
  default_prog = { 'powershell.exe', '-nologo' },
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  window_decorations = 'TITLE | RESIZE',
  window_close_confirmation = 'NeverPrompt',
  term = 'wezterm',
  window_padding = {
    left = 1,
    right = 1,
    top = 1,
    bottom = 1,
  },
  window_background_opacity = 0.95,
  text_background_opacity = 1.0,
  --color_scheme = 'EverforestDark (Gogh)',
  color_scheme = 'Catppuccin Frappe',
  font = wezterm.font(
    { family = 'FiraCode Nerd Font Mono' }
  ),
  font_size = 11.0,
  keys = {
    -- fix tab switching in VIM
    {
      key = 'PageUp',
      mods = 'CTRL',
      action = wezterm.action.DisableDefaultAssignment
    },
    {
      key = 'PageDown',
      mods = 'CTRL',
      action = wezterm.action.DisableDefaultAssignment
    }
  }
}
