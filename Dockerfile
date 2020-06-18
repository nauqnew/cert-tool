FROM node:8-alpine

MAINTAINER Lyas Spiehler

RUN apk add --update openssl git && \
    rm -rf /var/cache/apk/*

WORKDIR /root

RUN git clone https://github.com/nauqnew/cert-tool.git

WORKDIR /root/cert-tool

VOLUME /root/cert-tool/ca

RUN npm install

RUN npm install bower -g

RUN bower install --allow-root eonasdan-bootstrap-datetimepicker#latest bootstrap@3 jquery-ui

EXPOSE 8443

EXPOSE 8080

ENV PUBLICHTTP 127.0.0.1:8443

CMD ["node", "index.js"]
