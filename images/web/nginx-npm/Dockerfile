FROM lazabogdan/nginx:latest

# install npm, nodejs and git
RUN apt-get update && apt-get install -y \
	nodejs \
    npm \
    git

# link nodejs to node
RUN ln -s /usr/bin/nodejs /usr/bin/node