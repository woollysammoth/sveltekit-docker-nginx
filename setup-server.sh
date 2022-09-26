#!/bin/sh

echo "Update"

sudo apt update

echo "Let apt use packages over HTTPS"

sudo apt install apt-transport-https ca-certificates curl software-properties-common

echo "Add the GPG key for the official Docker repository"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Add the Docker repository to APT sources"

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Update"

sudo apt update

echo "Make sure you are about to install from the Docker repo instead of the default Ubuntu repo"

apt-cache policy docker-ce

echo "Install Docker"

sudo apt install docker-ce

echo "Create Docker CLI Plugins folder"

mkdir -p ~/.docker/cli-plugins/

echo "Download Docker Compose"

curl -SL https://github.com/docker/compose/releases/download/v2.11.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

echo "Make Docker Compose executable"

chmod +x ~/.docker/cli-plugins/docker-compose

echo "Allow HTTP and HTTPS traffic in with UFW"

sudo ufw allow 80/tcp
sudo ufw allow 443/tcp