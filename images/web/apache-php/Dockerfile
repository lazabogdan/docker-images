FROM ubuntu-debootstrap:14.04

# Environment
ENV DEBIAN_FRONTEND noninteractive

# install common packages
RUN apt-get update && apt-get install -y \
	python-software-properties && \
	add-apt-repository ppa:ondrej/php5-oldstable

# install apache and php
RUN apt-get update && apt-get install -y \
    php5 \
    php5-cli \
    apache2 \
    libapache2-mod-php5

# add apache configuration
ADD default /etc/apache2/sites-available/000-default.conf

# enable mod_rewrite
RUN a2enmod rewrite

# customize php configuration
RUN sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/apache2/php.ini
RUN sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/cli/php.ini
RUN sed -ri 's/^error_reporting\s*=.*$/error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_NOTICE/g' /etc/php5/apache2/php.ini
RUN sed -ri 's/^error_reporting\s*=.*$/error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_NOTICE/g' /etc/php5/cli/php.ini

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

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]