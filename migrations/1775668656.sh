echo "Update keyd config"
sudo cp "$OMARCHY_PATH"/default/keyd/*.conf /etc/keyd/
if [[ -f /etc/keyd/$(hostname).conf ]]; then
  sudo sed -i "s/f17/f15/" /etc/keyd/$(hostname).conf
fi

echo "Restart keyd daemon"
sudo systemctl restart keyd

echo "Update XKB config"
cp "$OMARCHY_PATH"/config/xkb/symbols/kog $HOME/.config/xkb/symbols/kog

echo "XKB updates require system reboot"
touch $HOME/.local/state/omarchy/reboot-required
