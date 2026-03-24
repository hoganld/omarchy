echo "Install Material Symbols font"
omarchy-pkg-add ttf-material-symbols-variable

echo "Update Waybar language widget"
cp $OMARCHY_PATH/config/waybar/config.jsonc ~/.config/waybar/config.jsonc
cp $OMARCHY_PATH/config/waybar/style.css ~/.config/waybar/style.css
omarchy-restart-waybar
