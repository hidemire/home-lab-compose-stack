#!/bin/sh
set -e

ip route add 10.15.0.0/24 via 172.28.241.3

exec /entrypoint.sh "$@"
