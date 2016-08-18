#!/bin/bash

# Update package lists
sudo apt-get update

# Install necessary packages
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install python-pip python-dev ca-certificates language-pack-en libffi-dev libcurl4-openssl-dev libssl-dev

sudo pip install --upgrade --force pip

# Install OpenStack cli tools
sudo pip install -U cffi
sudo pip install --upgrade 'urllib3[secure]'
sudo pip install pytz 
sudo pip install cryptography idna
sudo pip install python-{openstack,keystone,nova,glance,cinder,neutron,ceilometer,heat}client 
