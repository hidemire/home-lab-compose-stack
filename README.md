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
