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
