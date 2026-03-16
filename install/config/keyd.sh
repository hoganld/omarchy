# Copy the keyd config files
sudo mkdir -p /etc/keyd
sudo cp -R ~/.local/share/omarchy/default/keyd/*.conf /etc/keyd/
sudo systemctl enable --now keyd
