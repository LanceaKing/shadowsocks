# shadowsocks-docker

## Usage

```
docker run -d -e SS_KEY=<password> -e SS_METHOD=chacha20-ietf-poly1305 -e KT_MODE=fast2 -e KT_CRYPT=aes -p<server-port>:29900/udp -d lanceaking/shadowsocks
```

