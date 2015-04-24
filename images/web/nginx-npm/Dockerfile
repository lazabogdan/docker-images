FROM ubuntu-debootstrap:14.04

# Environment
ENV DEBIAN_FRONTEND noninteractive

# install common packages, nginx and npm
RUN apt-get update && apt-get install -y \
	nodejs \
    npm \
    git \
    nginx && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

# link nodejs to node
RUN ln -s /usr/bin/nodejs /usr/bin/node

# replace nginx default conf
COPY nginx.conf /etc/nginx/nginx.conf

# replace nginx default vhost
COPY default /etc/nginx/sites-available/default

# touch logs
RUN mkdir -p /app/logs && \
    touch /app/logs/access.log && \
    touch /app/logs/error.log

# create application structure
RUN mkdir -p /app/www

# create default index.html
COPY index.html /app/www/index.html

WORKDIR /app/www

EXPOSE 80

CMD ["/usr/sbin/nginx"]