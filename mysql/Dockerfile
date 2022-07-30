ARG MYSQL_VERSION=5.7
FROM mysql:${MYSQL_VERSION}

ARG TIMEZONE=UTC
ENV TZ ${TIMEZONE}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/

ARG MYSQL_CONTAINER_DIR=.
COPY ${MYSQL_CONTAINER_DIR}/my.cnf /etc/mysql/conf.d/my.cnf

RUN chmod 0444 /etc/mysql/conf.d/my.cnf

ENV MYSQL_ROOT_PASSWORD=foo
ENV MYSQL_DATABASE=${STPETERNJ_DATABASE}

