# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Dependencies

``` sh 
yay -S hyprland xdg-desktop-portal-hyprland waybar rofi alacritty hyprpaper dunst polkit-kde-agent wlogout hyprlock-git hypridle-git grim slurp swappy lf ttf-fira-sans otf-font-awesome spicetify-cli aylurs-gtk-shell cava
```

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:V0Iek/hyprland.git .hyprconfig
$ cd .hyprconfig
```

then use GNU stow to create symlinks

```
$ stow .
```
