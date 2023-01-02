# Shortcut инструкции

## Postgres database
Для того чтобы просто запустить posgresql можно воспользоваться этой командой:  
```
docker run --name hat-user-db \
            -v ./postgresql:/var/lib/postgresql/ \
            -p 5401:5432 \
            -e POSTGRES_USER=hat_user \
            -e POSTGRES_PASSWORD=test1234 \
            -e POSTGRES_DB=hat_user_db \
            -e PGDATA=/var/lib/postgresql/data \
            -d \
            postgres:15
```
  
--name имя запущенного контейнера. Важный параметр - в дальнейшем мы будем оперировать ими как адресами хостов.  
-v создаст вольюм для хранения данных в подпапке postgresql  
-p пробросит порт 5432 наружу в порт 5401 (localhost:5401)  
-e пробросит переменные окружения: юзер, пароль, база данных, папка хранения данных внутри контейнера  
-d (detached) запускает контейнер в фоновом режиме 
 postgres:15 забирает контейнер из репозитория посгреса, 15 версии   
   
 *Параметры можно изменять под свои нужды*
