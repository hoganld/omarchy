# Reverse install/config/makima.sh
sudo systemctl disable --now makima 2>/dev/null || true
sudo systemctl daemon-reload
sudo rm /etc/systemd/system/makima.service.d/override.conf 2>/dev/null || true
sudo rmdir /etc/systemd/system/makima.service.d 2>/dev/null || true
rm ~/.config/makima/*.toml 2>/dev/null || true
rmdir ~/.config/makima 2>/dev/null || true

