FROM php:7.1.5-fpm

# Note there will be a single warning:
# > apt-utils' package gets rid of the 'debconf: delaying package configuration,
#   since apt-utils is not installed.
# Tl;dr, you can ignore this warning.

# Required to add packages.sury.org to sources, which we need for php7.1-mysql.
# Note php:7.1-fpm base image already installs ca-certificates.
# @todo Consider add-apt-repository instead. However, this is a bit lighter.
RUN \
  apt-get update -y && \
  apt-get install -y \
    apt-transport-https \
    lsb-release \
    wget

RUN \
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
  wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

# todo: Do we need any of these? If so, check for php7.1 compatibility.
# - git
# - mysql-client (don't think this is needed since MySQL is a separate service.)
# - graphicsmagick
# - php-imagick (instead installing php7.1-imagick)
# - php-xml (instead installing php7.1-xml)
#
# See the list of existing PHP modules with `php -m`.
RUN \
  apt-get update && \
  apt-get install -y \
    php7.1-curl \
    php7.1-json \
    php7.1-mcrypt \
    php7.1-readline \
    php7.1-sqlite3 \
    php7.1-xml \
    php-memcached \
    php-xdebug \
    # supervisor \
    # MySQL.
    mysql-client \
    php7.1-mysql \
    # Image toolkits.
    php7.1-gd \
    php7.1-imagick \
    imagemagick \
    vim && \
  apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY html/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html
