FCITX_THEMES_PATH=${FCITX_THEMES_PATH:-~/.local/share/fcitx5/themes}

mkdir -p $FCITX_THEMES_PATH

for theme in miasma vantablack white; do
  if [[ -d "$OMARCHY_PATH/themes/$theme/fcitx5" ]]; then
    ln -snf "$OMARCHY_PATH/themes/$theme/fcitx5" "$FCITX_THEMES_PATH/$theme"
  fi
done
