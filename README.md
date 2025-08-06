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

