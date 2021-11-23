FROM debian:10

ENV PHP_VERSION=7.3
ENV GESTSUP_VERSION=3.2.15 

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
RUN apt-get install mariadb-client wget apache2 php$PHP_VERSION php$PHP_VERSION-mysql php$PHP_VERSION-xml php$PHP_VERSION-curl php$PHP_VERSION-imap php$PHP_VERSION-ldap php$PHP_VERSION-zip php$PHP_VERSION-mbstring php$PHP_VERSION-gd unzip ntp -y
COPY php.ini /etc/php/$PHP_VERSION/apache2/php.ini
VOLUME /var/www/html
RUN mkdir -p /var/www/html


COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]