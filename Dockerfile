FROM python:alpine
LABEL maintainer="LanceaKing <bomb_k@163.com>"

RUN set -ex \
    && apk add --no-cache supervisor libsodium-dev mbedtls-dev \
    && pip --no-cache-dir install https://github.com/shadowsocks/shadowsocks/archive/master.zip \
    && cd /tmp \
    && wget https://github.com/shadowsocks/kcptun/releases/download/v20170718/kcptun-linux-amd64-20170718.tar.gz -O kcptun.tar.gz \
    && tar xzpf kcptun.tar.gz server_linux_amd64 \
    && mv server_linux_amd64 /usr/local/bin/ktserver \
    && rm -rf /tmp/*

ENV SS_HOST    0.0.0.0
ENV SS_PORT    8388
ENV SS_KEY=
ENV SS_METHOD  chacha20-ietf-poly1305
ENV SS_TIMEOUT 300
ENV SS_ARGS=

ENV KT_TARGET  localhost:8388
ENV KT_LISTEN  0.0.0.0:29900
ENV KT_KEY=
ENV KT_MODE    fast2
ENV KT_CRYPT   aes
ENV KT_ARGS=

COPY supervisord.ini /etc/supervisor.d/supervisord.ini

CMD ["/usr/bin/supervisord"]

