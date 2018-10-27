#!/bin/bash
#####################################################################
# the script is responsible to install MongoDB into the Ubuntu instance
# ROOT access required
#####################################################################
# adding keys 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
# adding the link to the repository
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
# update packages index
apt-get update
# install MongoDB package
apt-get install -y mongodb-org
# start MongoDB service
systemctl start mongod
# add service to auto start
systemctl enable mongod
#checking service status
systemctl status mongod