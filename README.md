## fbold dotfiles
These are a bit of a mess right now bcause I've transitioned to wayland+hyprland+waybar from xorg+i3+i3blocks.
TODO: write a setup script that stows all appropriate directories, installs dependencies, symlinks what needs to be symlinked.

### How Manage .dotfiles
This folder should be cloned into the home directory.
It uses stow to keep all the configs (separated by stow packages) in one place.
To let stow do its thing and symlink these into their respective locations you need to run
```
stow <package name>
```

### dirs
The dirs package contains the xdg config which sets the default directory names for the home directory. I've renamed them in the config to the same as their default names but with lowercase. In order for this config to work these home directories needs to be renames wherever this config is used. When I get around to making an install script I need to make this functionality a part of it.

### Dependencies
- wayland
- hyprland
- hyprpaper
- keyd
- kitty
- vivid (github.com/sharkdp/vivid)
- ~~rofi~~
- fuzzel (this replaced rofi)
- wl-clipboard

