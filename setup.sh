# I suppose I could install dependencies here?
#

# keyd symlinking
sudo ln -sf "$HOME/dotfiles/keyd/default.conf" /etc/keyd/default.conf
sudo systemctl enable --now keyd
