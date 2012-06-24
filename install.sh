#!/bin/bash

# cleanup
locale-gen de_DE.UTF-8
apt-get -y --purge remove apache2* samba smbfs
apt-get update
apt-get upgrade -y
apt-get -y install build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev libcurl4-openssl-dev

# git
apt-get -y install git-core

# ruby
apt-get -y install python-software-properties
apt-add-repository ppa:brightbox/ruby-ng
apt-get update
apt-get -y install ruby1.9.3
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# nginx with passenger
apt-get -y install nginx-full
echo "passenger_root /usr/lib/phusion-passenger;" > /etc/nginx/conf.d/passenger.conf
/etc/init.d/nginx start

# postgres
apt-get -y install postgresql postgresql-9.1-postgis libpq-dev

# libs for rmagick
apt-get -y install libmagickwand-dev