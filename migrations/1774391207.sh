# Reverse install/config/makima.sh
sudo systemctl disable makima 2>/dev/null || true
sudo systemctl daemon-reload
sudo rm /etc/systemd/system/makima.service.d/override.conf
sudo rmdir /etc/systemd/system/makima.service.d
rm ~/.config/makima/*.toml
rmdir ~/.config/makima

