FROM debian:jessie

MAINTAINER "Laza Bogdan" <laza.bogdan@macro-net.ro>

# we'll need wget to fetch the key...
RUN apt-get update -y && \
    apt-get install -y wget

# Install HHVM
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list && \
    apt-get update -y && \
    apt-get install -y \
    hhvm

RUN mkdir -p /data
VOLUME ["/data"]

EXPOSE 9000
WORKDIR /data/www/public

# Run HHVM as FastCGI
ENTRYPOINT ["hhvm", "--mode", "server", "-vServer.Type=fastcgi", "-vServer.Port=9000"]