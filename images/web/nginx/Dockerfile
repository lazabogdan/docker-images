FROM ubuntu-debootstrap:14.04

# Environment
ENV DEBIAN_FRONTEND noninteractive

# install common packages and nginx
RUN apt-get update && apt-get install -y \
	curl \
    sudo \
    nginx

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