ARG MYSQL_VERSION=5.7
FROM mysql:${MYSQL_VERSION}

ARG TIMEZONE=UTC
ENV TZ ${TIMEZONE}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/

COPY ./mysql/my.cnf /etc/mysql/conf.d/my.cnf

RUN chmod 0444 /etc/mysql/conf.d/my.cnf


ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${STPETERNJ_DATABASE}

