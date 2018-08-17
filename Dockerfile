# Build Geth in a stock Go builder container
FROM golang:1.9-alpine as builder
##FROM ubuntu
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /commerciumx
RUN cd /commerciumx && make commerciumx

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /commerciumx/build/bin/commerciumx /usr/local/bin/

ADD start.sh /root/start.sh

EXPOSE 1911 1912 2019 2019/udp 2020/udp
ENTRYPOINT /root/start.sh
