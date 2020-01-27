#!/bin/sh
docker system prune -f

cd ~/docker/mail
docker-compose up -d
sleep 1

cd ~/docker/etracs
docker-compose up -d
sleep 3

cd ~/docker/gdx-client
docker-compose up -d

cd ~/docker/queue
docker-compose up -d

cd ~
