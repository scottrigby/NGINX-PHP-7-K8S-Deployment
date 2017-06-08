FROM php:7.1.5-fpm-alpine

ADD repositories /etc/apk/repositories

# See the list of existing PHP modules with `php -m`.
RUN apk update && apk add \
    php-curl \
    php-json \
    php-mcrypt \
    # Check, necessary?
    readline \
    php-sqlite3 \
    php-xml \
    php-memcache \
    # php-xdebug@community \
    # MySQL.
    mysql-client \
    php-mysql \
    # Image toolkits.
    php-gd \
    # To-do: find imagemagick package/solution for alpine.
    #php7.1-imagick \
    # Check if this helps. If not, nuke it.
    # graphicsmagick@community \
    imagemagick \
    vim

COPY html/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm"]
