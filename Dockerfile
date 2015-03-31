###
# swagger-editor - https://github.com/swagger-api/swagger-editor/
#
# Run the swagger-editor service on port 80
###
#
FROM gliderlabs/alpine:3.1
RUN apk --update add nodejs git bash gcc
RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf
RUN mkdir /runtime

MAINTAINER danielwhatmuff@gmail.com

RUN     ln -s /usr/bin/nodejs /usr/local/bin/node

WORKDIR /runtime
ADD     package.json    /runtime/package.json
RUN     npm install
RUN     npm install -g bower grunt-cli


ADD     bower.json      /runtime/bower.json
ADD     .bowerrc        /runtime/.bowerrc
RUN     bower --allow-root install

ADD     .   /runtime

# The default port of the application
# EXPOSE  80
# CMD     grunt build; grunt connect:dist
