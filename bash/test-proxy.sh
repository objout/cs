do_curl() {
  curl --url https://www.youtube.com \
    --head \
    --silent \
    --location \
    --proxy $1 | head -1
}

if [ -n "$HTTPS_PROXY" ] ; then
  do_curl $HTTPS_PROXY
else
  do_curl "socks5://127.0.0.1:10808"
fi

if [ $? -ne 0 ] ; then
  echo "proxy failed."
else
  echo "proxy success."
fi
