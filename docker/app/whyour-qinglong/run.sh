#!/usr/bin/env bash

docker pull whyour/qinglong:latest

docker run -dit \
  -v $PWD/ql/data:/ql/data \
  -p 5700:5700 \
  -e QL_PORT=5700 \
  --name qinglong \
  --hostname qinglong \
  --restart unless-stopped \
  whyour/qinglong:latest

# 进入容器
docker exec -it qinglong bash

# 配置 npm
pnpm config set registry https://registry.npmmirror.com/
#pnpm install -g

# 配置 pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 常用的库
# crypto-js
# prettytable
# dotenv
# jsdom
# date-fns
# MD5@1.3.0
# md5@2.x
# canvas
# tough
