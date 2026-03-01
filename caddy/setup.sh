#!/bin/bash

set -eE

sudo mkdir -p /etc/caddy

sudo mv Caddyfile /etc/caddy
sudo mv caddy.service /etc/systemd/system

sudo mv caddy /usr/bin/
sudo groupadd --system caddy
sudo useradd --system \
    --gid caddy \
    --create-home \
    --home-dir /var/lib/caddy \
    --shell /usr/sbin/nologin \
    --comment "Caddy web server" \
    caddy
