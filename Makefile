#git clone https://github.com/AlexeyBeley/my-kid.git
#sudo apt install make
#put secretes.sh in the same dir you run clone from(~)
SHELL := /bin/bash
PATH_TO_ROOT=~/my-kid

private_dir:
	mkdir -p ${PATH_TO_ROOT}/private &&\
	cp ../secrets.sh ${PATH_TO_ROOT}/private &&\
	chmod +x ${PATH_TO_ROOT}/private/secrets.sh

docker_install:
	sudo apt update
	sudo apt install docker.io -y

web_dir:
	sudo mkdir -p /var/www/docker_phpbb

user_access:
	sudo chmod 777 /var/run/docker.sock
	#sudo usermod -aG docker ${USER}

build: web_dir docker_install user_access
	source ${PATH_TO_ROOT}/private/secrets.sh && docker build . --tag horey

run: build
	source ${PATH_TO_ROOT}/private/secrets.sh && docker run -d -e SERVER_NAME -e DBHOST -e DBPORT -e DBNAME -e DBUSER -e DBPASSWD -e TABLE_PREFIX -p 80:80 horey














