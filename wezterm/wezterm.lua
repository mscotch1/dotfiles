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
  color_scheme = 'EverforestDark (Gogh)',
  font = wezterm.font({
    family = 'Monofur Nerd Font Mono'
  }),
  font_size = 12.0
}
