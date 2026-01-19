#!/bin/bash

FCITX_THEMES_PATH=${FCITX_THEMES_PATH:-~/.local/share/fcitx5/themes}

mkdir -p $FCITX_THEMES_PATH

for themepath in $OMARCHY_PATH/themes/*; do
  themename=$(basename $themepath)
  if [[ -d $themepath/fcitx5 ]]; then
    ln -snf "$themepath/fcitx5" "$FCITX_THEMES_PATH/$themename"
  fi
done
