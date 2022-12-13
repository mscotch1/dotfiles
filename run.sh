#/usr/bin/sh
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf $DOTFILES/nvim/ $HOME/.config/nvim
ln -sf $DOTFILES/kitty/ ~/.config/kitty
ln -sf $DOTFILES/tmux/ ~/.config/tmux
