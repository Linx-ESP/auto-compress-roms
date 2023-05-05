#!/bin/bash

# Update package index
sudo apt-get update

# Install Ansible and its dependencies
sudo apt-get install -y ansible

# Download Ansible playbook from URL
curl -L -o playbook.yml https://github.com/Linx-ESP/auto-compress-roms/blob/ansible-test1/ansible/install-dependencies.yaml

# Run Ansible playbook
ansible-playbook playbook.yml