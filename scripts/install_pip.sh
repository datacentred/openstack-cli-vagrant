#!/bin/bash

# Update package lists
sudo apt-get update

# Install necessary packages
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install python-pip python-dev ca-certificates language-pack-en

# Install OpenStack cli tools
sudo pip install pytz 
sudo pip install python-{openstack,keystone,nova,glance,cinder,neutron,ceilometer,heat}client 
