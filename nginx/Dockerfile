FROM ubuntu:16.04

MAINTAINER Jason Paige "j@jasonpaige.co.uk"

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
        nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    rm -rf /etc/nginx/sites-enabled/*

# Define mountable directories.
VOLUME [ "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log" ]

# nginx
COPY sites-enabled* /etc/nginx/sites-enabled/

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD [ "nginx" ]

# Expose ports.
EXPOSE 443
EXPOSE 80
