FROM lazabogdan/nginx-supervisord:latest

# install confd
RUN curl -sSL -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 \
    && chmod +x /usr/local/bin/confd

# copy image files
COPY . /app/

# add supervisord configuration
RUN echo "\n\n[program:confd]\n\
command=/usr/local/bin/confd -backend=\"env\" -config-file=\"/app/confd.toml\"\n" >> /app/supervisord.conf