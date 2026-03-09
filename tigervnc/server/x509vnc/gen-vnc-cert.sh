#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# TODO
SERVER_IP="192.168.90.85"
EXPIRE_DAYS=365
KEY_PATH=~/.vnc/vnc-server-private.pem
CERT_PATH=~/.vnc/vnc-server.pem

openssl req -x509 \
  -newkey rsa \
  -days ${EXPIRE_DAYS} \
  -nodes \
  -keyout ${KEY_PATH} \
  -out ${CERT_PATH} \
  -subj "/CN=$SERVER_IP" \
  -addext "subjectAltName=IP:$SERVER_IP"
