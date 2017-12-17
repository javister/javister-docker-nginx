# Docker образ сервера Nginx

## Введение

Данный образ базируется на образе [javister-docker-base](https://github.com/javister/javister-docker-nginx)
и содержит HTTP сервер NginX. Данный образ предназначен для создания
reverse proxy и FastCGI proxy.

## Пример запуска

```bash
docker run --name "nginx" -p 80:80 --env PUID=$UID --env PGID=$(id -g) -v /path/to/dir:/config:rw javister-docker-docker.bintray.io/javister/javister-docker-nginx:2
```

При запуске контейнера на основе данного образа желательно монтировать каталог по пути `/config`.
Тогда в этом каталоге будет создан подкаталог `nginx` с логами, каталогами для ручного конфигурирования,
SSL ключей и паролей.

## Конфигурирование

TBD