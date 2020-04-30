#!/bin/bash -e

mkdir /var/www/docker_phpbb
cd /var/www/docker_phpbb
git clone https://github.com/AlexeyBeley/phpbb.git
mkdir /var/www/docker_phpbb/phpbb/ssl
#ubuntu 20
sudo chmod 777 /var/run/docker.sock

export DBPASSWD=''
export DBHOST='phpbb.crgmvorrv472.us-east-2.rds.amazonaws.com'
export DBPORT='3306'
export DBNAME='phpbb_db'
export DBUSER='phpbb_user'
export TABLE_PREFIX='phpbb_'
export PHPBB_INSTALLED=false
docker-compose up -d