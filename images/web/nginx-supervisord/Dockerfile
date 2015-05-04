FROM lazabogdan/nginx:latest

# install python
RUN apt-get update && apt-get install -y \
    python

# install supervisor
RUN curl https://bootstrap.pypa.io/get-pip.py | python && \
	rm -rf get-pip.py && \
	pip install supervisor --pre

# add supervisor configuration
COPY supervisord.conf /app/supervisord.conf

# override the nginx CMD with supervisord
CMD ["/usr/local/bin/supervisord", "-c", "/app/supervisord.conf"]