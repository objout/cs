export HTTP_PROXY="socks5://127.0.0.1:7890"
export HTTPS_PROXY="socks5://127.0.0.1:7890"
export ALL_PROXY="socks5://127.0.0.1:7890"
export NO_PROXY="localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"

set_proxy() {
  local proxy_addr=${1:-"socks5://127.0.0.1:7890"}

  HTTP_PROXY="$proxy_addr"
  HTTPS_PROXY="$proxy_addr"
  ALL_PROXY="$proxy_addr"

  export HTTP_PROXY HTTPS_PROXY ALL_PROXY
}

unset_proxy() {
  unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
}
