# Composer Docker Container
FROM php:5.6-cli
MAINTAINER Laza Bogdan <laza.bogdan@macro-net.ro>

# Dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    zlib1g-dev \
    git \
    mercurial \
    subversion \
    libmcrypt-dev --no-install-recommends \
    && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install zip mcrypt mbstring

# Set memory limit
RUN echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory-limit.ini

# Set environmental variables
ENV COMPOSER_HOME /root/composer

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Display version information
RUN php --version
RUN composer --version

# Set up the application directory.
RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]