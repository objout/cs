#!/bin/bash

set -e

if [ -z "$1" ] ; then
  echo "Usage: ./$0 <url>"
fi

PROXY_SITE1=https://gh-proxy.org
PROXY_SITE2=https://v6.gh-proxy.org
PROXY_SITE3=https://hk.gh-proxy.org
PROXY_SITE4=https://cdn.gh-proxy.org
PROXY_SITE5=https://edgeone.gh-proxy.org

curl --url $PROXY_SITE3/$1 -LO
