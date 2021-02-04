#!/bin/bash
# Install Docker Engine on CentOS

# set up the docker repository
# Install the yum-utils package (which provides the yum-config-manager utility) and set up the stable repository.
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# install docker engine
yum install -y docker-ce docker-ce-cli containerd.io

# start docker
echo "docker starting..."
systemctl start docker