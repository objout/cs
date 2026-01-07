#!/usr/bin/env bash

SITE=mirrors.aliyun.com
OS=linux
ARCH=$(uname -m)
VERSION=28.2.2
DOCKER_PACKAGE=docker-${VERSION}.tgz

do_download() {
  URL="https://${SITE}/docker-ce/${OS}/static/stable/${ARCH}/$DOCKER_PACKAGE"
  curl --url $URL -sLO
}

do_setup() {
  groupadd docker
  mv {docker,containerd}.service docker.socket /etc/systemd/system
  tar xf $DOCKER_PACKAGE -C /usr/local/bin --strip-components 1
  systemctl enable --now docker.socket
  systemctl enable --now containerd.service
  systemctl enable --now docker.service
}

main() {
  do_download
  do_setup
}

main
