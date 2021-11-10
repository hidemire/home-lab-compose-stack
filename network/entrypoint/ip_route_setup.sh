#!/bin/sh
set -e

ip route add 10.15.0.0/24 via 172.28.241.100

exec /entrypoint.sh "$@"
