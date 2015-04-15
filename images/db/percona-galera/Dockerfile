FROM paulczar/percona-galera:latest

ENV CONFD_PREFIX /

ADD . /app/

RUN chmod +x /app/boot

CMD ["/app/boot", "/app/bin/boot"]