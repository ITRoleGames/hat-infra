#!bin/sh
docker pull ghcr.io/itrolegames/hat-game-back:latest
docker stop hat-game-back
docker system prune -f
docker run -d -p 9000:9000 --env APP_HOST=172.17.0.1 --env DB_PORT=5401 --env DB_USER=hat_user --env DB_PASSWORD=test1234 --name=hat-game-back ghcr.io/itrolegames/hat-game-back:master
