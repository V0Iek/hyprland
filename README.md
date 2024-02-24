# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Dependencies

``` sh 
yay -S hyprland xdg-desktop-portal-hyprland waybar rofi alacritty hyprpaper dunst polkit-kde-agent wlogout swaylock-effects swayidle grim slurp swappy
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
