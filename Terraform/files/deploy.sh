#! /bin/bash
#####################################################################
# the script is responsible to install MongoDB into the Ubuntu instance
# ROOT access required
#####################################################################
# create a folder for application
mkdir /home/aalimov/app
# clone repository
git clone https://github.com/Artemmkin/reddit.git /home/aalimov/app/
# browse to app folder
cd /home/aalimov/app
# activate rvm for current bash session  
source /home/aalimov/.rvm/scripts/rvm
# install app dependencies
bundle install
# start puma web server d means - 
#puma -d
# check if the web-server is up and running
#ps aux | grep puma
#run as a service
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma