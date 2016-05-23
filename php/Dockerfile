FROM ubuntu:16.04

MAINTAINER Jason Paige "j@jasonpaige.co.uk"

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
        php && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/www && \
    chown -R www-data:www-data /var/www

# Define mountable directories.
VOLUME [ "/var/log", "/var/www" ]

# php
COPY fpm/conf.d/php-fpm.conf   /etc/php/7.0/fpm/php-fpm.conf
COPY fpm/conf.d/www.conf       /etc/php/7.0/fpm/pool.d/www.conf
COPY fpm/conf.d/10-opcache.ini /etc/php/7.0/fpm/conf.d/10-opcache.ini

# Define working directory.
WORKDIR /var/www

# Define default command.
CMD ["php-fpm7.0"]

# Expose ports.
EXPOSE 9000
