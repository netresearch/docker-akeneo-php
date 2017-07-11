FROM php:5-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends libicu-dev libmcrypt-dev libpng-dev libcurl3-dev libxml2-dev libjpeg-dev libpng-dev libssl-dev mysql-client \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd --enable-gd-native-ttf --with-jpeg-dir=/usr/lib/x86_64-linux-gnu --with-png-dir=/usr/lib/x86_64-linux-gnu \
    && docker-php-ext-install mbstring pdo_mysql mysqli intl mcrypt gd exif curl soap zip opcache bcmath \
    && pecl install -f mongo \
    && pecl install apcu-4.0.11 \
    && docker-php-ext-enable mongo apcu \
    && apt-get autoremove \
    && apt-get clean -y \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/* \
    && for logs in `find /var/log -type f`; do > $logs; done \
    && rm -rf /usr/share/locale/* \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /var/cache/apt/*.bin

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

COPY setup/ /

RUN a2enmod rewrite \
    && a2ensite akeneo_pim \
    && a2dissite 000-default.conf

RUN chmod +x /usr/local/bin/akeneo-docker-entrypoint

WORKDIR /var/www/html
VOLUME /var/www/html

ENTRYPOINT ["/usr/local/bin/akeneo-docker-entrypoint"]

CMD ["apache2-foreground"]
