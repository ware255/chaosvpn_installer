#!/bin/sh
sudo apt update
sudo apt install software-properties-common debian-sdinet-keyring tinc iproute2 build-essential git flex libssl-dev zlib1g-dev byacc perl-base debhelper devscripts bison

sudo vi /etc/apt/sources.list

echo "deb http://debian.sdinet.de/ stable chaosvpn" >> /etc/apt/sources.list
echo "deb-src http://debian.sdinet.de/ stable chaosvpn" >> /etc/apt/sources.list

wget -q http://debian.sdinet.de/signkey.asc -O- | apt-key add -

sudo apt update

sudo apt install chaosvpn

mkdir -p /etc/tinc/chaos/hosts
tincd --net=chaos --generate-keys=2048

sudo /etc/init.d/chaosvpn start
