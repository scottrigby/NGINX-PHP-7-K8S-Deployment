FROM php:7.1.5-fpm-alpine

# Note there will be a single warning:
# > apt-utils' package gets rid of the 'debconf: delaying package configuration,
#   since apt-utils is not installed.
# Tl;dr, you can ignore this warning.

# Required to add packages.sury.org to sources, which we need for php7.1-mysql.
# Note php:7.1-fpm base image already installs ca-certificates.
# @todo Consider add-apt-repository instead. However, this is a bit lighter.
# RUN \
#   apk update -y && \
#   apk add -y \
#     apt-transport-https \
#     lsb-release \
#     wget

# RUN \
#   echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
#   wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

# todo: Do we need any of these? If so, check for php7.1 compatibility.
# - git
# - mysql-client (don't think this is needed since MySQL is a separate service.)
# - graphicsmagick
# - php-imagick (instead installing php7.1-imagick)
# - php-xml (instead installing php7.1-xml)
#
# See the list of existing PHP modules with `php -m`.
ADD repositories /etc/apk/repositories

# Fix Error:
# > loading shared library libncursesw.so.6: No such file or directory (needed by /usr/local/sbin/php-fpm).
#
# - bash
#   Attempt to allow ncurses (\) below. May not have helped us.
# - libc6-compat
#   See https://github.com/grpc/grpc/issues/6126
# - ncurses
#   trying, in itself didn't fix it
# - ncurses-libs
#   let's see
RUN apk update && apk add bash ncurses ncurses-libs libc6-compat

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
