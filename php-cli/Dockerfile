ARG PHP_VERSION
FROM php:${PHP_VERSION}-cli

RUN apt-get update -yqq
RUN apt-get install -y vim zip curl wget git default-mysql-client
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

RUN docker-php-ext-install mysqli pdo pdo_mysql


###########################################################################
# Install XDebug
###########################################################################
RUN pecl channel-update pecl.php.net
RUN pear config-set php_ini /usr/local/etc/php/php.ini
RUN pecl config-set php_ini /usr/local/etc/php/php.ini
ARG XDEBUG_VERSION
RUN pecl -q install xdebug-${XDEBUG_VERSION}
COPY ./php-cli/xdebug.ini /usr/local/etc/php/conf.d


###########################################################################
# Install SSHD
###########################################################################
RUN apt-get install -y openssh-server \
      # fix ssh start up bug
      # @see https://github.com/ansible/ansible-container/issues/141
    && mkdir /var/run/sshd


# add default public key to authorized_keys
COPY ./php-cli/ssh/insecure_id_rsa.pub /root/insecure_id_rsa.pub
RUN mkdir -p /root/.ssh \
 && cat /root/insecure_id_rsa.pub >> /root/.ssh/authorized_keys \
 && rm -rf /root/insecure_id_rsa.pub \
;

WORKDIR /var/www

# @see https://docs.docker.com/engine/examples/running_ssh_service/
CMD ["/usr/sbin/sshd", "-D"]
