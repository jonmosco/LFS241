#!/bin/bash
#
# Moving to ansible

apt-get update
apt-get install apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add the stable repository
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

# Install the docker engine
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

# Configure Docker sto start on boot
sudo systemctl enable docker
