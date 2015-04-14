FROM ubuntu-debootstrap:14.04

# Environment
ENV DEBIAN_FRONTEND noninteractive
ENV CONFD_VERSION 0.9.0
ENV NGINX_VHOST laravel

# install common packages && nginx
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    python \
    nginx && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

# install supervisor
RUN curl https://bootstrap.pypa.io/get-pip.py | python && \
	rm -rf get-pip.py && \
	pip install supervisor --pre

# install confd
RUN curl -sSL -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v{$CONFD_VERSION}/confd-{$CONFD_VERSION}-linux-amd64 \
    && chmod +x /usr/local/bin/confd

# install hhvm
RUN apt-get install -y software-properties-common && \
	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
    add-apt-repository 'deb http://dl.hhvm.com/ubuntu trusty main' && \
    apt-get update && \
    apt-get install -y hhvm && \
    apt-get clean && \
    add-apt-repository -r 'deb http://dl.hhvm.com/ubuntu trusty main' && \
    apt-key del 1be7a449 && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/dl.hhvm.*

# enable hhvm for /usr/bin/php
RUN update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# copy image files
COPY . /app/

# remove nginx default vhost
RUN rm /etc/nginx/sites-enabled/default && \
    rm /etc/nginx/sites-available/default

# enable custom vhost
RUN ln -s /app/vhosts/$NGINX_VHOST /etc/nginx/sites-available/$NGINX_VHOST && \
    ln -s /app/vhosts/$NGINX_VHOST /etc/nginx/sites-enabled/$NGINX_VHOST

# touch logs
RUN mkdir -p /app/logs && \
    touch /app/logs/access.log && \
    touch /app/logs/error.log

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
	--install-dir=/usr/local/bin \
	--filename=composer

WORKDIR /app

# create application structure
RUN mkdir -p www/public

# laravel storage permissions
RUN mkdir -p \
	www/storage/app \
	www/storage/framework/cache \
	www/storage/framework/sessions \
	www/storage/framework/views \
	www/storage/logs && \
	chmod 644 www/storage

EXPOSE 80
CMD ["/usr/local/bin/supervisord", "-c", "/app/supervisord.conf"]