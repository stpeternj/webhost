ARG PHP_VERSION=7.1.33
FROM php:${PHP_VERSION}-apache

RUN apt-get update -yqq
RUN apt-get install -y vim zip curl wget git

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN a2enmod rewrite

RUN rm /var/log/apache2/access.log
RUN rm /var/log/apache2/error.log
RUN rm /var/log/apache2/other_vhosts_access.log

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
COPY apache/php-local.ini /usr/local/etc/php/conf.d
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql


RUN pear config-set php_ini /usr/local/etc/php/php.ini
RUN pecl config-set php_ini /usr/local/etc/php/php.ini
ARG XDEBUG_VERSION
RUN pecl install xdebug-${XDEBUG_VERSION} && docker-php-ext-enable xdebug
WORKDIR /var/www

EXPOSE 80 443
