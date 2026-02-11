#!/bin/bash

# 下载地址
# https://mirrors.aliyun.com/centos/?spm=a2c6h.13651104.d-2001.1.5f661d37veI1mG

# CentOS过期源（centos-vault）
# https://developer.aliyun.com/mirror/centos-vault

# CentOS arm源（centos-altarch）
# https://developer.aliyun.com/mirror/centos-altarch/

# CentOS Stream源（centos-stream）
# https://developer.aliyun.com/mirror/centos-stream

# CentOS debuginfo源（centos-debuginfo）
# https://developer.aliyun.com/mirror/centos-debuginfo/

# backup
cp -r /etc/yum.repos.d /root

# centos8
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo

curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo

# centos6
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-6.10.repo

curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-6.10.repo

# centos7
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo

curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo

yum clean all && yum makecache

sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
