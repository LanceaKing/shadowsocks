FROM python:alpine
LABEL maintainer "bomb_k@163.com"
RUN pip install --no-cache-dir shadowsocks
RUN sed -i 's/EVP_CIPHER_CTX_cleanup/EVP_CIPHER_CTX_reset/g' /usr/local/lib/python3.7/site-packages/shadowsocks/crypto/openssl.py
ENTRYPOINT ["/usr/local/bin/ssserver"]
