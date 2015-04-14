FROM debian:jessie
MAINTAINER "Laza Bogdan" <laza.bogdan@macro-net.ro>

RUN apt-get -y update && \
	apt-get -y install git && \
    apt-get -y install golang-go && \
    apt-get -y clean && \
    mkdir -p /build/

COPY go.sh /build/
RUN chmod +x /build/go.sh
RUN /build/go.sh && rm -rf /build/

EXPOSE 53
ENTRYPOINT ["/mesos-dns"]