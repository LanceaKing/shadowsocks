FROM python:alpine
LABEL maintainer="LanceaKing <bomb_k@163.com>"

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 443
ENV PASSWORD=
ENV METHOD      chacha20-ietf-poly1305
ENV TIMEOUT     300
ENV ARGS=

RUN set -ex \
    && apk add --no-cache libsodium-dev mbedtls-dev \
    && pip --no-cache-dir install https://github.com/shadowsocks/shadowsocks/archive/master.zip

COPY optimize.conf /etc/sysctl.d/optimize.conf

CMD exec ssserver \
      -s $SERVER_ADDR \
      -p $SERVER_PORT \
      -k ${PASSWORD:-$(hostname)} \
      -m $METHOD \
      -t $TIMEOUT \
      $ARGS
