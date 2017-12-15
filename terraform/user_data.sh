#!/bin/bash

yum install wget git -y
cd /tmp
wget https://bootstrap.pypa.io/get-pip.py

python get-pip.py
pip install ansible

git clone https://github.com/yellusandeep/webserver1.git

cd /tmp/webserver1/ansible
ansible-playbook webserver.yml -i "localhost," --connection local > /var/log/playbook.log
