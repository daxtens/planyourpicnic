#!/bin/bash

sudo apt-get update

sudo apt-get install -y python-virtualenv python-dev postgresql libpq-dev git

cd /vagrant
rm -rf bin/ lib/ include/
virtualenv .
source bin/activate
pip install fabric
fab setup

echo "You're good to go: vagrant ssh, cd /vagrant, source bin/activate"