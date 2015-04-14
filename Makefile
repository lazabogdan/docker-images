DOCKER=docker
BUILDFLAGS=--rm

.PHONY: all php web tools db hhvm nginx composer artisan data mariadb mesos-dns laravel

all:	php web tools db data
php:	hhvm
web:	nginx
tools:	composer artisan
db:     mariadb

hhvm:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-php-hhvm images/php/hhvm

nginx:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-web-nginx images/web/nginx

composer:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-tools-composer images/tools/composer

artisan:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-tools-artisan images/tools/artisan

data:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-data images/data

mariadb:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-db-mariadb images/db/mariadb

mesos-dns:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-mesos-dns images/mesos-dns

laravel:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/laravel images/apps/laravel