DOCKER=docker
BUILDFLAGS=--rm

.PHONY: all php web tools db apps
all:	php web tools db apps data
php:	hhvm
web:	nginx nginx-npm nginx-grunt-bower nginx-gulp-bower
tools:	composer artisan
db:     mariadb percona-galera
apps:   laravel

.PHONY: hhvm
hhvm:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/hhvm images/php/hhvm

.PHONY: nginx
nginx:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx images/web/nginx

.PHONY: nginx-npm
nginx-npm:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-npm images/web/nginx-npm

.PHONY: nginx-grunt-bower
nginx-grunt-bower:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-grunt-bower images/web/nginx-grunt-bower

.PHONY: nginx-gulp-bower
nginx-gulp-bower:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-gulp-bower images/web/nginx-gulp-bower

.PHONY: composer
composer:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/composer images/tools/composer

.PHONY: artisan
artisan:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/artisan images/tools/artisan

.PHONY: data
data:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/data images/data

.PHONY: mariadb
mariadb:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/mariadb images/db/mariadb

.PHONY: percona-galera
percona-galera:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/percona-galera images/db/percona-galera

.PHONY: mesos-dns
mesos-dns:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/mesos-dns images/mesos-dns

.PHONY: laravel
laravel:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/laravel images/apps/laravel