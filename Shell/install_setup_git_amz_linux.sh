#!/bin/bash

# Update package list and install Git
sudo yum update -y
sudo yum install -y git

# Configure Git global settings
echo "What is your name for Git?"
read git_name
echo "What is your email for Git?"
read git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"

# Verify Git installation
git --version

echo "Git installed and configured successfully."
