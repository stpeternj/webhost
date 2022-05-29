ARG PHP_VERSION=7.1.33
FROM php:${PHP_VERSION}-apache

RUN apt-get update -yqq
RUN apt-get install -y vim zip curl wget git

RUN rm /var/log/apache2/access.log
RUN rm /var/log/apache2/error.log
RUN rm /var/log/apache2/other_vhosts_access.log
RUN a2enmod rewrite


RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
COPY apache/php-local.ini /usr/local/etc/php/conf.d
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql


WORKDIR /var/www

EXPOSE 80 443
