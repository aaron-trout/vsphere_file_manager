#!/bin/bash

# This script will auto-install ruby, bundler and this scripts requirements
# under ubuntu, and then symlink the script from the current location into
# /usr/local/bin directory for easy access.

set -e

apt-get update
apt-get install -y ruby bundler

bundle install

ln -s ${PWD}/vsphere_file_manager.rb /usr/local/bin/vsphere_file_manager
