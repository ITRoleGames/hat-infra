# Первоначальная настройка webhook на сервере
1. Залогиниться в Github Packages(Container registry https://ghcr.io):
   * Создать токен в Github: Settings > Developer settings> Personal access tokens > Tokens(classic)
   * Выполнить на сервере команду: `echo <ТОКЕН> | docker login ghcr.io -u myusername --password-stdin
2. Скопировать на сервер и выполнить `install_webhooks.sh` для запуска webhook как linux-сервиса
3. Положить файлы из видектории `/webhooks/scripts` на сервер в `/opt/scripts`
4. Перезапустить сервис:
```shell
systemctl daemon-reload
systemctl start webhook.service
```
5. Проверить что хук доступен по адрусе HOST:PORT/hooks/redeploy-api-gateway
# Добавление нового webhook
1. Создать новый .sh в `/webhooks/scripts` и скопировать на сервер в  `/opt/scripts`
2. Добавить хук в `/opt/hooks/hooks.json` по аналогии с `redeploy-api-gateway`
3. Перезапустить сервис: 
```shell
systemctl daemon-reload
systemctl start webhook.service
```
4. Проверить, что хук доступен
