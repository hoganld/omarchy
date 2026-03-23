cp $OMARCHY_PATH/config/systemd/user/omarchy-ddcci-cache.service ~/.config/systemd/user/
cp $OMARCHY_PATH/config/systemd/user/omarchy-ddcci-cache.timer ~/.config/systemd/user/
cp $OMARCHY_PATH/config/systemd/user/omarchy-ddcci-sync.service ~/.config/systemd/user/
cp $OMARCHY_PATH/config/systemd/user/omarchy-ddcci-sync.timer ~/.config/systemd/user/
systemctl --user enable --now omarchy-ddcci-cache.timer
