# I suppose I could install dependencies here?
#

# keyd symlinking
sudo ln -sf "$HOME/dotfiles/keyd/default.conf" /etc/keyd/default.conf
sudo systemctl enable --now keyd

# copy fonts over to user font directory
sudo ln -sf "$HOME/dotfiles/fonts/NectoMono-Regular.ttf" "$HOME/.local/share/fonts/NectoMono-Regular.ttf"
