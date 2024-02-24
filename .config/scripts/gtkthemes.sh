#!/bin/sh

THEME="Catppuccin-Mocha-Standard-Lavender-Dark"
ICONS="Sweet-Rainbow"
FONT="Fira Sans Semibold 10"
CURSOR="McMojave-cursors"

SCHEMA="gsettings set org.gnome.desktop.interface"

apply_themes() {
  ${SHEMA} gtk-theme "$THEME"
  ${SHEMA} icon-theme "$ICONS"
  ${SHEMA} cursor-theme "$CURSOR"
  ${SHEMA} font-name "$FONT"
}
