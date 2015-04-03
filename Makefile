DOCKER=docker
BUILDFLAGS=--rm

.PHONY: all php-all web-all tools-all hhvm nginx composer

all:		php-all web-all tools-all
php-all:	hhvm
web-all:	nginx
tools-all:	composer

hhvm:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-php-hhvm images/php/hhvm

nginx:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-web-nginx images/web/nginx

composer:	
		${DOCKER} build ${BUILDFLAGS} -t lazabogdan/docker-tools-composer images/tools/composer
