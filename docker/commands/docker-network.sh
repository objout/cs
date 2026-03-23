#!/usr/bin/env bash

DRIVER=bridge
SUBNET=192.168.99.0/24
IP_RANGE=192.168.99.0/24
GATEWAY=192.168.99.254
NETWORK_NAME=br0

docker network create \
 --driver=$DRIVER \
 --subnet=$SUBNET \
 --ip-range=$IP_RANGE \
 --gateway=$GATEWAY \
 $NETWORK_NAME
