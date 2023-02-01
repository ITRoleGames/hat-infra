#!bin/sh
docker pull ghcr.io/itrolegames/hat-user-back:master
docker stop hat-user-back
docker system prune -f
docker run -d -p 9001:9001 --env APP_HOST=172.17.0.1 --env DB_PORT=5401 --env DB_USER=hat_user --env DB_PASSWORD=test1234 --name=hat-user-back ghcr.io/itrolegames/hat-user-back:master
