#!/bin/bash

# Update the package list and install OpenSSH
sudo apt-get update
sudo apt-get install -y openssh-client

# Check if ssh-keygen is installed
if ! [ -x "$(command -v ssh-keygen)" ]; then
  echo 'Error: ssh-keygen is not installed. Please install OpenSSH before running this script.' >&2
  exit 1
fi

# Prompt for key file name
read -p "Enter file name for RSA key (default: id_rsa): " keyfile
keyfile=${keyfile:-id_rsa}

# Generate RSA key pair
ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)-$(date +%Y-%m-%d)" -f "$HOME/.ssh/$keyfile"

# Display public key
echo "Here's your public key:"
cat "$HOME/.ssh/$keyfile.pub"

# Set appropriate permissions for private key
chmod 600 "$HOME/.ssh/$keyfile"
