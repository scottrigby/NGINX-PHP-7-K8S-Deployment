FROM php:7.1-fpm

RUN \
  apt-get update -y && \
  apt-get install -y \
    wget

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list.d/dotdeb.org.list && \
    echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list.d/dotdeb.org.list && \
    wget -O- http://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN \
  apt-get update && \
  apt-get install -y \
    php7.0-mysql

COPY Dockerfile /
COPY src/ /var/www/html/
