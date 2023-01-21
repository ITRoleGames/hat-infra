#Настройка webhook на сервере
1. Залогиниться в Github Packages(Container registry https://ghcr.io):
   * Создать токен в Github: Settings > Developer settings> Personal access tokens > Tokens(classic)
   * Выполнить на сервере команду: `echo <ТОКЕН> | docker login ghcr.io -u myusername --password-stdin
2. Скопировать на сервер и выполнить `install_webhooks.sh`
3. Положить файлы из видектории `/webhooks/scripts` на сервер в `/opt/scripts`
4. Выполнить команды:
```shell
systemctl daemon-reload
systemctl start webhook.service
```
