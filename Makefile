DOCKER=docker
BUILDFLAGS=--rm

.PHONY: all php web tools db apps
all:	php web tools db apps data
php:	hhvm
web:	nginx nginx-supervisord nginx-fastcgi nginx-hhvm nginx-npm nginx-grunt-bower nginx-gulp-bower apache-php
tools:	composer artisan
db:     mariadb percona-galera
apps:   laravel

.PHONY: hhvm
hhvm:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/hhvm images/php/hhvm

.PHONY: nginx
nginx:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx images/web/nginx

.PHONY: nginx-supervisord
nginx-supervisord:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-supervisord images/web/nginx-supervisord

.PHONY: nginx-fastcgi
nginx-fastcgi:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-fastcgi images/web/nginx-fastcgi

.PHONY: nginx-hhvm
nginx-hhvm:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-hhvm images/web/nginx-hhvm

.PHONY: nginx-npm
nginx-npm:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-npm images/web/nginx-npm

.PHONY: nginx-grunt-bower
nginx-grunt-bower:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-grunt-bower images/web/nginx-grunt-bower

.PHONY: nginx-gulp-bower
nginx-gulp-bower:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/nginx-gulp-bower images/web/nginx-gulp-bower

.PHONY: apache-php
apache-php:
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/apache-php images/web/apache-php

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