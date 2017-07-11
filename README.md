# Apache + PHP for Akeneo

Docker image running Apache with PHP configured for Akeneo (especially [netresearch/akeneo-app](https://hub.docker.com/r/netresearch/akeneo-app/)).

## How to use this image

### Run

This image doesn't contain but requires the Akeneo sources as well as a MySQL/MariaDB database in order to run - thus, it's best to run it using docker-compose. See the [docker-compose.yml](https://github.com/netresearch/docker-akeneo-php-apache/blob/master/docker-compose.yml) for an example.

### Environment variables

Given, you are using this image with `volumes_from` [netresearch/akeneo-app](https://hub.docker.com/r/netresearch/akeneo-app/), you can or must set the environment variables for it on the container running this image (again see the [docker-compose.yml](https://github.com/netresearch/docker-akeneo-php-apache/blob/master/docker-compose.yml) for an example).

### Running with other Akeneo sources

This image is designed to be ran with `volumes_from` [netresearch/akeneo-app](https://hub.docker.com/r/netresearch/akeneo-app/) - however you can run it with other sources as well: Just mount them to `/var/www/html`.