#!/bin/sh
cd ~/docker/mail
docker-compose down

cd ~/docker/etracs
docker-compose down

cd ~/docker/gdx-client
docker-compose down

cd ~/docker/queue
docker-compose down

cd ~

docker system prune -f
