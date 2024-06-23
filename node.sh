#!/bin/bash

sudo apt update
sudo apt install -y ca-certificates curl gnupg

# Import NodeSource repository GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Set Node.js version (change NODE_MAJOR for the desired version)
NODE_MAJOR=21

# Create NodeSource repository file
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt update
sudo apt install -y nodejs
node --version
npm --version

# Install development tools for native addons
sudo apt install -y build-essential

echo "Node.js and npm installation completed."
