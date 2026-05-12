#!/bin/bash

# 1. 安装 iptables
sudo apt install iptables libip6tc2 libxtables12 netbase libmnl0 \
  libnetfilter-conntrack3 libnfnetlink0 libnftnl11

# 2. 加载内核模块
# 检查
lsmod | grep br_netfilter

# 临时加载
sudo modprobe br_netfilter

# 开机自动加载(centos)
sudo cat > /etc/sysconfig/modules/br_netfilter.modules <<EOF
#!/bin/bash
/sbin/modprobe br_netfilter
EOF
sudo chmod +x /etc/sysconfig/modules/br_netfilter.modules

# 开机自动加载(ubuntu)
sudo cat > /etc/modules-load.d/br_netfilter.conf <<EOF
br_netfilter
EOF

# 3. 设置内核参数
# 检查
sudo sysctl -a | grep 'bridge\|forward'

sudo cat > /etc/sysctl.d/docker.conf <<EOF
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF
sudo sysctl -p /etc/sysctl.d/docker.conf
