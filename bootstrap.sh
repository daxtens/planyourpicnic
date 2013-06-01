#!/bin/bash

sudo apt-get update

sudo apt-get install -y python-virtualenv python-dev postgresql-9.1 postgresql-client-9.1 libpq-dev git fabric phppgadmin

cd /vagrant

fab setup

echo "You're good to go: vagrant ssh, cd /vagrant, python main.py"