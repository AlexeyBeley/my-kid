#!/bin/bash

#create_database docker
export DB_NAME="sections_db_test"

running_container_id=$(docker ps -f "name=$DB_NAME" -q)
if [[ !  -z  $running_container_id""  ]]
then
  docker kill $running_container_id
  docker rm $running_container_id
fi

docker pull mysql/mysql-server:5.7
docker_id=$(docker run --name=$DB_NAME -d -p 3306:3306  mysql/mysql-server:5.7)

pass_line=$(docker logs $docker_id | grep "GENERATED ROOT PASSWORD")
DB_PASSWORD=$(echo $pass_line | awk '{print $5}')
export DB_PASSWORD

#create flask
#run tests