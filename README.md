# Docker образ сервера Nginx

[ ![Download](https://api.bintray.com/packages/javister/docker/javister%3Ajavister-docker-nginx/images/download.svg) ](https://bintray.com/javister/docker/javister%3Ajavister-docker-nginx/_latestVersion)
[![Build Status](https://travis-ci.org/javister/javister-docker-nginx.svg?branch=master)](https://travis-ci.org/javister/javister-docker-nginx)

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