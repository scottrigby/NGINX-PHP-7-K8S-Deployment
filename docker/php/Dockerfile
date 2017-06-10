FROM php:7.1.5-fpm-alpine

ADD docker/repositories /etc/apk/repositories

# To-do: Find better way to install GD (Drupal install requirement).
# See: https://stackoverflow.com/a/42100719
RUN apk update && apk add --no-cache \
        libpng libpng-dev && \
    docker-php-ext-install gd && \
    apk del \
        libpng-dev

# See the list of existing PHP modules with `php -m`.
RUN apk update && apk add \
    ncurses-libs \
    php-curl \
    php-json \
    php-mcrypt \
    readline \
    php-sqlite3 \
    php-xml \
    php-memcache \
    # To-do: add DEV env switch for dev-only packages.
    # php-xdebug@community \
    mysql-client \
    php-mysql \
    imagemagick \
    vim

COPY docker/php/html/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm"]
