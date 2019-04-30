FROM alpine:3.9
MAINTAINER pch18.cn

ENV METHOD=aes-256-cfb
ENV P_20001=password

COPY run.sh /run.sh

RUN apk update -y && \
    apk add py-pip && \
    pip install --upgrade pip && \
    pip install shadowsocks

CMD /bin/sh /run.sh
