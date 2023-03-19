#!/bin/bash

# Update package list and install Git
sudo apt-get update
sudo apt-get install -y git

# Verify Git installation
git --version

echo "Git installed successfully."
