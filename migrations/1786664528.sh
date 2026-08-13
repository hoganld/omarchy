# This is not an accidental copy of the previous migration. It is an intentional copy.
echo "Copying updated XKB config..."

cp $OMARCHY_PATH/config/xkb/symbols/kog $HOME/.config/xkb/symbols/kog

touch $HOME/.local/state/omarchy/reboot-required
