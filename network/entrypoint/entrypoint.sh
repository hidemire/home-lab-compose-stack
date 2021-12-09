#!/bin/sh
set -e

ip route add 10.15.0.0/24 via 172.28.241.100

key=$(find /tools/certs/ -iname "*.key" | head -1)
cert=$(find /tools/certs/ -iname "*.crt" | head -1)

if [ -f "$key" ] && [ -f "$cert" ]; then
  export REPLACE_DEFAULT_CERTIFICATE=true
  export DEFAULT_CERTIFICATE_KEY_FILE="$key"
  export DEFAULT_CERTIFICATE_CERT_FILE="$cert"
fi

exec /entrypoint.sh "$@"
