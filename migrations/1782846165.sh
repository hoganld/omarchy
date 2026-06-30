echo "Update Waybar config..."

cp $OMARCHY_PATH/config/waybar/config.jsonc $HOME/.config/waybar/config.jsonc

omarchy-restart-waybar
