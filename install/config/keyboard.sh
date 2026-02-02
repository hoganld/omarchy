#!/bin/bash

KBD=$(gum choose "usa" "launch" "mac" "code" --header "Select your keyboard")

INPUT_CONF="~/.config/hypr/input.conf"
HYPR_CONF="~/.config/hypr/hyprland.conf"

sed -i "s/kb_layout[[:space:]]*=[[:space:]]*.*/kb_layout = $KBD/" $INPUT_CONF
sed -i "s/kb_options[[:space:]]*=[[:space:]]*.*/kb_options =/" $INPUT_CONF

if [[ "$KBD" == "mac" ]]; then
  # Compensate for missing keys: Compose, Hiragana_Katakana, Print
  sed -i -e "/[[:space:]]*source[[:space:]]*=[[:space:]]*~\/\.local\/share\/omarchy\/default\/hypr\/keys\/macutils\.conf[[:space:]]*.*$/s/^[[:blank:]]*#[[:blank:]]*//" $HYPR_CONF
else
  # Disable Mac keybindings if not a Mac
  sed -i -e "/^[[:space:]]*source[[:space:]]*=[[:space:]]*~\/\.local\/share\/omarchy\/default\/hypr\/keys\/macutils\.conf[[:space:]]*.*$/s/^/# /" $HYPR_CONF
fi
