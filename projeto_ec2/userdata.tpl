#!/bin/bash

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

mkdir -p /opt/ruby/

cat > /opt/ruby/docker-compose.yml <<EOF
version: "3.9"

services:
  nginx:
    image: public.ecr.aws/f2h9v7q6/ruby:latest
    container_name: ruby
    privileged: true
    user: root
    ports: 
      - "3000:3000"
    networks:
      ruby-net:
        aliases: 
          - ruby-net
#    volumes:
#     - /var/run/docker.sock:/var/run/docker.sock
     
networks:
  ruby-net:
EOF

cd /opt/ruby/ && docker compose up -d

mkdir -p /opt/nginx/

cat > /opt/nginx/docker-compose.yml <<EOF
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

cd /opt/nginx/ && docker compose up -d