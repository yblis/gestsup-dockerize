FROM debian:12

ARG PHP_VERSION
ARG GESTSUP_VERSION

ENV PHP_VERSION=${PHP_VERSION}
ENV GESTSUP_VERSION=${GESTSUP_VERSION}

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
RUN apt-get install curl mariadb-client wget apache2 php$PHP_VERSION php$PHP_VERSION-mysql php$PHP_VERSION-xml php$PHP_VERSION-curl php$PHP_VERSION-imap php$PHP_VERSION-ldap php$PHP_VERSION-zip php$PHP_VERSION-mbstring php$PHP_VERSION-gd unzip ntp php-intl -y
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY php.ini /etc/php/$PHP_VERSION/apache2/php.ini
VOLUME /var/www/html
RUN mkdir -p /var/www/html

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
