FROM lazabogdan/nginx-npm:latest

# install grunt & bower globally
RUN npm install -g gulp-cli bower

# Running bower on continuous integration (disable interactive & analytics operations)
ENV CI true