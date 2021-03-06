#!/bin/bash -e

mkdir /var/www/docker_phpbb
cd /var/www/docker_phpbb
git clone https://github.com/AlexeyBeley/phpbb.git
mkdir /var/www/docker_phpbb/phpbb/ssl
openssl req -nodes -x509 -newkey rsa:2048 \
  -subj "/CN=$SERVER_NAME" \
  -keyout ssl/default.key \
  -out ssl/default.crt

#ubuntu 20
sudo chmod 777 /var/run/docker.sock

export SERVER_NAME="my-kid.co.il"
export DBPASSWD=''
export DBHOST='phpbb-db.crgmvorrv472.us-east-2.rds.amazonaws.com'
export DBPORT='3306'
export DBNAME='phpbb_prod_db'
export DBUSER='phpbb_prod_user'
export TABLE_PREFIX='phpbb_'
export PHPBB_INSTALLED=true
export AUTO_DB_MIGRATE=false

docker build . --tag horey
#No ssl
docker run -d -e SERVER_NAME -e DBHOST -e DBPORT -e DBNAME -e DBUSER -e DBPASSWD -e TABLE_PREFIX -p 80:80 horey

#docker-compose up -d

#With ssl
#docker run -v /var/www/docker_phpbb/phpbb/ssl:/etc/apache2/ssl -e SERVER_NAME -e DBHOST -e DBPORT -e DBNAME -e DBUSER -e DBPASSWD -e TABLE_PREFIX -p 80:80 -p 443:443 apache7.2

mysql -h $DBHOST -P $DBPORT -u $DBUSER -D $DBNAME -p










