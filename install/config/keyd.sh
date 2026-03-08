# Copy the keyd config files
sudo mkdir -p /etc/keyd
sudo cp -R ~/.local/share/omarchy/default/keyd/*.conf /etc/keyd/

# Restart keyd so that changes take effect
sudo systemctl restart keyd
