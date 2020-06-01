#!/bin/bash
set -x
#create_database docker
export DB_NAME="sections_db_test"

running_container_id=$(docker container ls --all -q -f name=$DB_NAME)
if [[ !  -z  $running_container_id""  ]]
then
  docker kill $running_container_id
  docker rm $running_container_id
fi

docker pull mysql/mysql-server:5.7
docker_id=$(docker run --name=$DB_NAME -d -p 3306:3306  mysql/mysql-server:5.7)

sleep 10

pass_line=$(docker logs $docker_id | grep "GENERATED ROOT PASSWORD")
DB_PASSWORD=$(echo $pass_line | awk '{print $5}')
export DB_PASSWORD
set +x
#create flask
#run tests