FROM php:5

RUN echo "memory_limit=-1" > "$PHP_INI_DIR/conf.d/memory-limit.ini" \
 && echo "date.timezone=${PHP_TIMEZONE:-UTC}" > "$PHP_INI_DIR/conf.d/date_timezone.ini"

COPY ./akeneo-php-* /usr/local/bin/

RUN chmod +x /usr/local/bin/akeneo-php-*

ARG WITH_GIT=true
RUN akeneo-php-install-deps

ENV COMPOSER_ALLOW_SUPERUSER 1
RUN akeneo-php-install-composer

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

# This image most likely won't actually serve Akeneo
# thus the entrypoint (which will bootstrap Akeneo)
# doesn't make much sense here
# However it's still in the image if you need it
#ENTRYPOINT ["akeneo-php-entrypoint"]

CMD ["php", "-a"]
