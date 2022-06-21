# Home Lab Compose Stack

```bash
docker network create --subnet=172.28.241.0/24 backend
ROOT_DOMAIN=example.com docker-compose up -d
```

```bash
cd network && mkdir certs && cd certs
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout cert.key -out cert.crt -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,DNS:*.hidemire.localhost,IP:127.0.0.1"
```

## wg-portal setup

PostUp

```bash
iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

PostDown

```bash
iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
```

Server IP address

```text
10.15.0.1/24
```

DNS Servers

```text
172.28.241.11
```

Crowdsec

```bash
docker-compose exec crowdsec cscli hub update
docker-compose exec crowdsec cscli hub upgrade

docker-compose exec crowdsec cscli bouncers add bouncer-traefik
docker-compose exec crowdsec cscli decisions add --ip 192.168.0.101
docker-compose exec crowdsec cscli decisions delete --ip 192.168.0.101
```
