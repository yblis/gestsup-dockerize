FROM debian:11

ENV PHP_VERSION=8.1
ENV GESTSUP_VERSION=3.2.30

RUN apt-get update
RUN apt-get install ca-certificates apt-transport-https software-properties-common wget curl lsb-release -y
RUN curl -sSL https://packages.sury.org/php/README.txt | bash -x

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
RUN apt-get install mariadb-client wget apache2 php$PHP_VERSION php$PHP_VERSION-mysql php$PHP_VERSION-xml php$PHP_VERSION-curl php$PHP_VERSION-imap php$PHP_VERSION-ldap php$PHP_VERSION-zip php$PHP_VERSION-mbstring php$PHP_VERSION-gd php$PHP_VERSION-intl unzip ntp php-intl -y
COPY php.ini /etc/php/$PHP_VERSION/apache2/php.ini
VOLUME /var/www/html
RUN mkdir -p /var/www/html


COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
