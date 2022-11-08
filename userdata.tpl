#!/bin/bash

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

cat > /opt/docker-compose.yml <<EOF
version: "3.9"

services:
  nginx:
    image: nginx:latest
    container_name: nginx
    privileged: true
    user: root
    ports: 
      - "80:80"
    networks:
      nginx-net:
        aliases: 
          - nginx-net
    volumes:
     - /var/run/docker.sock:/var/run/docker.sock
     
networks:
  nginx-net:
EOF

cd /opt/ && docker compose up -d