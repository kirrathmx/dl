#!/bin/bash
# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
# Update system
sudo apt-get update -y
## Install APache
apt-get remove apache2 -y
apt-get purge apache2 -y
sudo apt-get install apache2 -y
## Install PHP
apt-get install php libapache2-mod-php -y
# Enabling Mod Rewrite
sudo a2enmod rewrite
sudo php5enmod mcrypt
## Configure HTML index
cd /root
rm index.txt
wget http://pwrmx.com/dl/index.txt
cp /root/index.txt /var/www/html/index.html
rm index.txt
# Set Permissions
sudo chown -R www-data:www-data /var/www
# Restart Apache
sudo service apache2 restart