# danish-dots

My Dotfiles 

## DEPENDENCIES
- Pacman
  - hyprland & wayland (WM)
  - networkmanager (for wifi interface)
  - hyprlock (lockscreen)
  - ttf-meslo-nerd (fonts)
  - ~~swaybg~~ hyprpaper (wallpaper)
  - swaync (notification)
  - waybar (bar)
  - grim, slurp, swappy (screenshot)
  - nwg-bar (shutdown menu)
  - stow (dotfiles stow)
  - wofi (menu)
  - foot (main terminal)
- AUR
    - hyprfloat 
    - tty-clock (clock)
    - volnoti (volume slider)
    - python-pywalfox (Firefox color matching)
## Installation steps
1. clone repo
```sh
git clone https://github.com/colla538/dofiles.git
```

2. cd to `~/.dotfiles`

```sh
cd ~./dotfiles
```

4. Use `stow` in `~/.dotfiles` directory to put the config in their places

```sh
stow .
```

