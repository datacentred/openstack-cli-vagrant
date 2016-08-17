#!/bin/bash

# Update package lists
sudo apt-get update

# Install necessary packages
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ca-certificates language-pack-en

# Install OpenStack cli tools
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install python-openstackclient 
