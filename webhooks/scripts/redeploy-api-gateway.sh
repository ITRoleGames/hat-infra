#!bin/sh
docker pull ghcr.io/itrolegames/hat-api-gateway:latest
docker stop hat-api-gateway
docker system prune -f
docker run -d -p 9002:9002 -p 9003:9003 --env USER_HOST=172.17.0.1 --env GAME_HOST=172.17.0.1 --env RABBIT_HOST=172.17.0.1 --name=hat-api-gateway ghcr.io/itrolegames/hat-api-gateway:latest
