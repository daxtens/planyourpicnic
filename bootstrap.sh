#!/bin/bash

sudo apt-get update

sudo apt-get install -y python-virtualenv python-dev postgresql libpq-dev git fabric

cd /vagrant
rm -rf bin/ lib/ include/
virtualenv .
source bin/activate
fab setup

echo "You're good to go: vagrant ssh, cd /vagrant, source bin/activate"