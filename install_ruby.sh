#!/bin/bash 
#####################################################################
# the script is responsible to install ruby into the Ubuntu instance
#####################################################################
#adding keys 
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# download and install stable rvm 
curl -sSL https://get.rvm.io | bash -s stable
# load and apply settings
source ~/.rvm/scripts/rvm
# install requirements
rvm requirements
# install Ruby
rvm install 2.4.1
# set version using by default
rvm use 2.4.1 --default
# install Bundler (a tool for managing ruby dependencies wort )
gem install bundler -V --no-ri --no-rdoc
# check Ruby installation
ruby -v
# check Bundler installation
bundle -v