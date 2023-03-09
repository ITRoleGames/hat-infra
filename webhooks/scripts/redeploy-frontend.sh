#!bin/sh
docker pull ghcr.io/itrolegames/hat-frontend:master
docker stop hat-frontend
docker system prune -f
docker run -d -p 80:80 --name=hat-frontend ghcr.io/itrolegames/hat-frontend:latest
