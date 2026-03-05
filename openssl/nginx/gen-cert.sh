#!/bin/bash

set -eE

cat > ip.cnf <<'EOF'
[req]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[dn]
CN = 1.2.3.4

[req_ext]
subjectAltName = @alt_names

[alt_names]
IP.1 = 1.2.3.4
EOF

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout server.key \
  -out server.crt \
  -config ip.cnf

# 确认文件已生成
ls -l
# 应包含：server.key  server.crt  ip.cnf
