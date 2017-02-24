FROM php:7.1-fpm

RUN \
  apt-get update -y && \
  apt-get install -y \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    wget

RUN \
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
  wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

RUN \
  apt-get update && \
  apt-get install -y \
    mysql-client \
    php7.1-mysql

COPY resources/docker/php/Dockerfile /
COPY src/ /var/www/html/
