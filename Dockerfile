FROM python:alpine
LABEL maintainer "bomb_k@163.com"
RUN pip install --no-cache-dir shadowsocks
ENTRYPOINT ["/usr/local/bin/ssserver"]
