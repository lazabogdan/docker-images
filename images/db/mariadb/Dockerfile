FROM debian:jessie

MAINTAINER "Laza Bogdan" <laza.bogdan@macro-net.ro>

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

# repo management
RUN apt-get update -y && \
    apt-get install -y python-software-properties \
    software-properties-common

# import and register the GPG key
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db

# add MariaDB official repository
RUN add-apt-repository 'deb http://mariadb.biz.net.id//repo/10.1/debian sid main'

# install MariaDB & utilities
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server \
    mariadb-client \
    pwgen

# change bind address to 0.0.0.0
RUN sed -i -r 's/bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/my.cnf

# add scripts
ADD create_admin_user.sh /create_admin_user.sh
ADD run.sh /run.sh
RUN chmod 775 /*.sh

# add volumes
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# set environment
ENV TERM dumb
ENV MARIADB_USER admin

EXPOSE 3306

CMD ["/run.sh"]