FROM php:7.1-fpm

RUN \
  apt-get update -y && \
  apt-get install -y --no-install-recommends apt-utils \
    software-properties-common && \
  add-apt-repository ppa:ondrej/php && \
  apt-get update -y && \
  apt-get install -y \
    php7.1-mysql

COPY Dockerfile /
COPY src/ /var/www/html/
