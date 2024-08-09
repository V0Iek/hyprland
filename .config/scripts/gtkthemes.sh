#!/bin/sh

THEME="Catppuccin-Mocha-Standard-Lavender-Dark"
ICONS="Sweet-Blue"
FONT="Fira Sans Semibold 10"
CURSOR="McMojave-cursors"

SCHEMA="gsettings set org.gnome.desktop.interface"

apply_themes() {
  ${SCHEMA} gtk-theme "$THEME"
  ${SCHEMA} icon-theme "$ICONS"
  ${SCHEMA} cursor-theme "$CURSOR"
  ${SCHEMA} font-name "$FONT"
}

apply_themes
