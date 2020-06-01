docker pull mysql/mysql-server:5.7

#shell> docker images
#REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
#mysql/mysql-server   latest              3157d7f55f8d        4 weeks ago         241MB

docker run --name=db_local -d mysql/mysql-server:5.7
