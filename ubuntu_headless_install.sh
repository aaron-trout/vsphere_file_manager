#!/bin/bash

# This script will auto-install ruby, bundler and this scripts requirements
# under ubuntu, and then symlink the script from the current location into
# /usr/local/bin directory for easy access.

set -e

apt-get update
apt-get install -y curl
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source /usr/local/rvm/scripts/rvm

gem install bundler
bundle install

ln -s ${PWD}/vsphere_file_manager.rb /usr/local/bin/vsphere_file_manager
