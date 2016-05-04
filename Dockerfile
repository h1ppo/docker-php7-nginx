FROM ubuntu:16.04

MAINTAINER Jason Paige "j@jasonpaige.co.uk"

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
        php \
        nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/www

# Define mountable directories.
VOLUME [ "/etc/nginx/certs", "/etc/nginx/conf.d", "/etc/nginx/sites-available", "/etc/nginx/sites-enabled", "/etc/php/7.0/cli", "/etc/php/7.0/fpm" "/var/log", "/var/www" ]

# nginx
# COPY nginx/certs           /etc/nginx/certs
# COPY nginx/nginx.conf      /etc/nginx/nginx.conf
# COPY nginx/conf.d          /etc/nginx/conf.d
# COPY nginx/sites-available /etc/nginx/sites-available
# COPY nginx/sites-enabled   /etc/nginx/sites-enabled
COPY www                   /var/www

# php
COPY php/fpm/conf.d/10-opcache.ini /etc/php/7.0/fpm/conf.d/10-opcache.ini

COPY start.sh /root/start.sh
RUN chmod 770 /root/start.sh

# Define working directory.
WORKDIR /var/www

# Define default command.
CMD [ "/root/start.sh" ]

# Expose ports.
EXPOSE 443
EXPOSE 80
