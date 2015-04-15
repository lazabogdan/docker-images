DOCKER=docker
BUILDFLAGS=--rm

.PHONY: all php web tools db apps

all:	php web tools db apps data
php:	hhvm
web:	nginx
tools:	composer artisan
db:     mariadb percona-galera
apps:   laravel

.PHONY: hhvm nginx composer artisan data mariadb percona-galera mesos-dns laravel

hhvm:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/hhvm images/php/hhvm

nginx:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx images/web/nginx

composer:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/composer images/tools/composer

artisan:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/artisan images/tools/artisan

data:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/data images/data

mariadb:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/mariadb images/db/mariadb

percona-galera:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/percona-galera images/db/percona-galera

mesos-dns:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/mesos-dns images/mesos-dns

laravel:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/laravel images/apps/laravel