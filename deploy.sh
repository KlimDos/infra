#!/bin/bash
#####################################################################
# the script is responsible to install MongoDB into the Ubuntu instance
# ROOT access required
#####################################################################
# create a folder for application
mkdir ~/app
# clone repository
git clone https://github.com/Artemmkin/reddit.git ~/app/
# browse to app folder
cd ~/app
# install app dependencies
bundle install
# activate rvm for current bash session  
source ~/.rvm/scripts/rvm
# start puma web server d means - 
puma -d
# check if the web-server is up and running
ps aux | grep puma