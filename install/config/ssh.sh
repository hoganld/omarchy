# Set default SSH config to use 1Password for as the SSH agent
mkdir -p ~/.ssh

tee ~/.ssh/config >/dev/null <<EOF
Host *
  IdentityAgent ~/.1password/agent.sock
EOF
