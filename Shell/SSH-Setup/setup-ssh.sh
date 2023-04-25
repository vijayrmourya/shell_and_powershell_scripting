#!/bin/bash

# Get the username and remote machine name as input
read -p "Enter your username: " username
read -p "Enter the remote machine name: " remote_machine

# Generate an SSH key pair
echo "Generating SSH key pair..."
ssh-keygen -t rsa

# Copy the public key to the remote machine
echo "Copying public key to remote machine..."
ssh-copy-id $username@$remote_machine

# Test SSH login
echo "Testing SSH login..."
ssh $username@$remote_machine "echo 'SSH login successful!'"

# Edit SSH configuration to enable logging of full process
echo "Enabling logging of full process..."
sudo sed -i 's/#LogLevel INFO/LogLevel VERBOSE/g' /etc/ssh/sshd_config

# Restart SSH service
echo "Restarting SSH service..."
sudo systemctl restart sshd

# Test logging of full process
echo "Testing logging of full process..."
ssh $username@$remote_machine "ps -aux"
```

# To use this script, save it to a file, for example, `setup_ssh_login.sh`, and make it executable by running `chmod +x setup_ssh_login.sh`. Then, run the script by typing `./setup_ssh_login.sh` in the terminal. The script will prompt you to enter your username and the remote machine name, and it will then generate an SSH key pair, copy the public key to the remote machine, test SSH login, enable logging of full process, restart the SSH service, and test logging of full process. 

# Note: This script assumes that you have sudo privileges on the machine and that the SSH service is already installed and running.