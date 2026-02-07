# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Dependencies

``` sh 
yay -S --needed hyprland xdg-desktop-portal-hyprland rofi kitty swww polkit-kde-agent wlogout hyprlock hypridle grim slurp satty lf ttf-fira-sans otf-font-awesome spicetify-cli waybar cava nemo swaync wl-clipboard kdeconnect udiskie cliphist wl-clip-persist
```

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

### Firefox theme

[AnimatedFox](https://github.com/RemyIsCool/AnimatedFox)

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:V0Iek/hyprland.git .dotfiles/hyprland
$ cd .dotfiles
```

then use GNU stow to create symlinks

```
$ stow hyprland
```
