FROM php:7.1-fpm

EXPOSE 80
EXPOSE 443

COPY Dockerfile /
COPY src/ /var/www/html/
