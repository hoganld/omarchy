#!/bin/bash


set_alacritty_font () {
  sed -i -e "s/^size[[:space:]]*=[[:space:]]*.*$/size = $1/" ~/.config/alacritty/alacritty.toml
}


set_ghostty_font () {
  sed -i -e "s/^font-size[[:space:]]*=[[:space:]]*.*$/font-size = $1/" ~/.config/ghostty/config
}


set_kitty_font () {
  sed -i -e "s/^font_size[[:space:]]*.*$/font_size $1/" ~/.config/kitty/kitty.conf
}


sub_waybar_font () {
  sed -i -e "s/^[[:space:]]*font-size:[[:space:]]*$1;/  font-size: $2;/" ~/.config/waybar/style.css
}


sub_waybar_padding () {
  sed -i -e "s/^[[:space:]]*padding:[[:space:]]*$1[[:space:]]*$2;/  padding: $3 $4;/" ~/.config/waybar/style.css
}


comment_out_scale () {
  sed -i -e "/^[[:space:]]*env[[:space:]]*=[[:space:]]*GDK_SCALE[[:space:]]*,[[:space:]]*$1[[:space:]]*$/s/^/# /" $MONITOR_CONF
  sed -i -e "/^[[:space:]]*monitor[[:space:]]*=[[:space:]]*,[[:space:]]*preferred[[:space:]]*,[[:space:]]*auto[[:space:]]*,[[:space:]]*$2[[:space:]]*$/s/^/# /" $MONITOR_CONF
}


uncomment_scale () {
  sed -i -e "/[[:space:]]*env[[:space:]]*=[[:space:]]*GDK_SCALE[[:space:]]*,[[:space:]]*$1[[:space:]]*$/s/^[[:blank:]]*#[[:blank:]]*//" $MONITOR_CONF
  sed -i -e "/[[:space:]]*monitor[[:space:]]*=[[:space:]]*,[[:space:]]*preferred[[:space:]]*,[[:space:]]*auto[[:space:]]*,[[:space:]]*$2[[:space:]]*$/s/^[[:space:]]*#[[:space:]]*//" $MONITOR_CONF
}


set_hidpi_xresources () {
  touch ~/.Xresources
  if $(grep -q "Xft.dpi:" ~/.Xresources); then
    sed -i -e "s/^[[:space:]]Xft.dpi:[[:space:]]*.*$/Xft.dpi: 192/" ~/.Xresources
  else
    echo "Xft.dpi: 192" >> ~/.Xresources
  fi
}


clear_hidpi_xresources () {
  if [[ -f ~/.Xresources ]]; then
    sed -i -e "s/^[[:space:]]*Xft.dpi:[[:space:]]*.*$//" ~/.Xresources
  fi
}


MONITOR_CONF=~/.config/hypr/monitors.conf

if [[ ! -f "$MONITOR_CONF" ]]; then
  echo "Error: $MONITOR_CONF not found."
  exit 1
fi

STANDARD_RES="1x pixel density (Standard)"
HIDPI_RES="2x pixel density (HIDPI/Retina)"
MONITOR_SCALE=$(gum choose "$STANDARD_RES" "$HIDPI_RES" --header "Select your monitor resolution")

if [[ "$MONITOR_SCALE" == "$STANDARD_RES" ]]; then
  echo "Setting resolution to 1x"

  comment_out_scale "2" "auto"
  uncomment_scale "1" "1"

  set_alacritty_font "12"
  set_ghostty_font "12"
  set_kitty_font "12.0"

  sub_waybar_font "12px" "18px"
  sub_waybar_font "10px" "15px"
  sub_waybar_padding "0px" "6px" "6px" "9px"

  clear_hidpi_xresources

elif [[ "$MONITOR_SCALE" == "$HIDPI_RES" ]]; then
  echo "Setting resolution to 2x"

  comment_out_scale "1" "1"
  uncomment_scale "2" "auto"

  set_alacritty_font "9"
  set_ghostty_font "9"
  set_kitty_font "9.0"

  sub_waybar_font "18px" "12px"
  sub_waybar_font "15px" "10px"
  sub_waybar_padding "6px" "9px" "0px" "6px"

  set_hidpi_xresources

else
  echo "Error: bad answer received"
  exit 1
fi
