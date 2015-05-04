FROM lazabogdan/nginx-hhvm:latest

# copy image files
COPY . /app/

# remove nginx default vhost
RUN rm /etc/nginx/sites-enabled/default

# enable laravel vhost
RUN ln -s /app/laravel /etc/nginx/sites-enabled/laravel

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
	--install-dir=/usr/local/bin \
	--filename=composer

# create application structure && laravel storage permissions
RUN mkdir -p \
	public \
	storage/app \
	storage/framework/cache \
	storage/framework/sessions \
	storage/framework/views \
	storage/logs && \
	chmod 644 storage