#!/bin/bash

# query package information
rpm -qpi package.rpm

# query package file list
rpm -qpl package.rpm

# 下载某个包及其依赖
yum install yum-utils -y
repotrack nginx
