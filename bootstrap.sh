#!/bin/bash

sudo apt-get update

sudo apt-get install -y python-virtualenv python-dev postgresql libpq-dev git fabric

cd /vagrant
fab setup

echo "You're good to go: vagrant ssh, cd /vagrant, python main.py"