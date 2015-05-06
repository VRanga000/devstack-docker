#!/bin/sh
DEBIAN_FRONTEND=noninteractive sudo apt-get -qqy update || sudo yum update -qy
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy git || sudo yum install -qy git
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy python-libvirt || sudo yum install -qy python-libvirt
sudo chown stack:stack /home/stack
cd /home/stack
git clone https://git.openstack.org/openstack-dev/devstack
cd devstack
