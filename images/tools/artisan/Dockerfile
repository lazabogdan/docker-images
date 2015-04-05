# Artisan Docker Container
FROM php:5.6-cli
MAINTAINER Laza Bogdan <laza.bogdan@macro-net.ro>

# Dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    zlib1g-dev \
    libmcrypt-dev --no-install-recommends

RUN docker-php-ext-install zip mcrypt mbstring pdo_mysql

# Set memory limit
RUN echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory-limit.ini

# Display version information
RUN php --version

# Set up the application directory.
RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

# Set up the command arguments
ENTRYPOINT ["php", "artisan"]
CMD ["--help"]