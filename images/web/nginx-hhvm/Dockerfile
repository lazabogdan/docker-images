FROM lazabogdan/nginx-fastcgi:latest

# install hhvm
RUN apt-get install -y software-properties-common && \
	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
    add-apt-repository 'deb http://dl.hhvm.com/ubuntu trusty main' && \
    apt-get update && \
    apt-get install -y \
    hhvm

# enable hhvm for /usr/bin/php
RUN update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

# add supervisord configuration
RUN echo "\n[program:hhvm]\n\
command=/usr/bin/hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000\n" >> /app/supervisord.conf