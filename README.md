docker build -t seeddms:1 .

docker stop seeddms
docker rm seeddms

# make it accessible through port 8082
docker run -d -ti \
	--name seeddms \
	--restart=always \
	-p 8082:80 \
	-e SYSTEM_TIMEZONE="Europe/Berlin" \
	seeddms:1

docker exec -ti seeddms /bin/bash

# assuming your docker host's address is 172.17.0.1 use the following URL for
# basic setup

http://172.17.0.1:8082/install/

# when done with setup use
docker exec -ti seeddms rm /var/www/seeddms50x/seeddms-5.0.5/conf/ENABLE_INSTALL_TOOL

# and open seeddms
http://172.17.0.1:8082
