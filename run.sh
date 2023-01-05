#/usr/bin/sh
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf $DOTFILES/nvim/ $HOME/.config/nvim
ln -sf $DOTFILES/kitty/ $HOME/.config/kitty
ln -sf $DOTFILES/tmux/ $HOME/.config/tmux
ln -sf $DOTFILES/wezterm/ $HOME/.config/wezterm
