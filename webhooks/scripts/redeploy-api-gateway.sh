#!bin/sh
docker pull ghcr.io/itrolegames/hat-api-gateway:master
docker stop hat-api-gateway
docker system prune -f
docker run -d -p 9002:9002 --env APP_HOST=172.17.0.1 --name=hat-api-gateway ghcr.io/itrolegames/hat-api-gateway:master
