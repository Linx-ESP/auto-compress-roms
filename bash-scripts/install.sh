#!/bin/bash

# Update package index
sudo apt-get update

# Install Ansible and its dependencies
sudo apt-get install -y ansible

# Download Ansible playbook from URL
curl -L -o playbook.yml https://raw.githubusercontent.com/Linx-ESP/auto-compress-roms/ansible-test1/ansible/install-dependencies.yaml

# Run Ansible playbook
ansible-playbook playbook.yml

# Download and install WIT (Wiimm's ISO Tools)
wget https://wit.wiimm.de/download/wit-v3.05a-r8638-x86_64.tar.gz
unp wit-v3.05a-r8638-x86_64.tar.gz
sudo bash ./wit-v3.05a-r8638-x86_64/install.sh 
