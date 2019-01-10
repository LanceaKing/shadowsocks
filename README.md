# shadowsocks-docker

### Usage Example
`docker run -d -v /source/config.json:/dest/config.json -p 2018:2018 lanceaking/shadowsocks -c /dest/config.json`
`docker run -d -p 2018:2018 lanceaking/shadowsocks -s 0.0.0.0 -p 2018 -k y0ur_p4ssw0rd -m aes-256-cfb`

