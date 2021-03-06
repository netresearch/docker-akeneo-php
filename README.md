# Supported tags and respective `Dockerfile` links

- `5`, `latest` ([Dockerfile](https://github.com/netresearch/docker-akeneo-php/blob/master/5/Dockerfile))
- `5-apache`, `apache` ([apache/Dockerfile](https://github.com/netresearch/docker-akeneo-php/blob/master/5/apache/Dockerfile))

# PHP + Apache images for Akeneo

Docker images with PHP built for Akeneo (especially [netresearch/akeneo-app](https://hub.docker.com/r/netresearch/akeneo-app/)).

### Environment variables

Given, you are using these images with [netresearch/akeneo-app](https://hub.docker.com/r/netresearch/akeneo-app/), you can or must set the environment variables for it on the container running this image (see the [docker-compose.yml](https://github.com/netresearch/docker-akeneo-php/blob/master/docker-compose.yml) for an example).

There is **one additional environment variable** for the Apache image: `AWAIT_AKENEO_BUILD_DONE` - set this to `1` to make the `command` wait for the file  `./vendor/akeneo-build-done` in the current `WORKDIR` before proceeding (by default its `0`).

## PHP image

The PHP image is built on top of [php:5](https://hub.docker.com/r/library/php/)  and meant as foundation for building and maintaining Akeneo (see this [Dockerfile](https://github.com/netresearch/docker-akeneo-app/blob/master/Dockerfile) and this [docker-compose.override.yml](https://github.com/netresearch/docker-akeneo-app/blob/master/docker-compose.override.yml) for examples).


## Apache image

The Apache image is built on top of [php:5-apache](https://hub.docker.com/r/library/php/) and meant for serving Akeneo only.

This image doesn't contain but requires the Akeneo sources mounted to `/var/www/html`, a MySQL/MariaDB database and optionally a MongoDB in order to run - thus, it's best to run it using docker-compose. Again see the [docker-compose.yml](https://github.com/netresearch/docker-akeneo-php/blob/master/docker-compose.yml) for an example.

### Shell commands
     
- `akeneo-php-install-composer`

    Installs composer along with [hirak/prestissimo](https://github.com/hirak/prestissimo) to speed up package installs.