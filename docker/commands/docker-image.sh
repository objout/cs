#!/bin/bash

# 以 Repository:Tag 显示镜像
docker image ls --format "{{ .Repository }}:{{ .Tag }}"
