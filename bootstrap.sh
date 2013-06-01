#!/bin/bash

sudo apt-get update

sudo apt-get install -y python-virtualenv python-dev postgresql-9.1 postgresql-client-9.1 libpq-dev git fabric

cd /vagrant

sudo -u postgres psql << EOF
CREATE USER planyourpicnic WITH PASSWORD 'planyourpicnic';
CREATE DATABASE planyourpicnic;
GRANT ALL PRIVILEGES ON DATABASE planyourpicnic TO planyourpicnic;
EOF

fab setup

echo "You're good to go: vagrant ssh, cd /vagrant, python main.py"