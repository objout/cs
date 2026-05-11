# CORS

## 问题

浏览器通过访问 nginx 部署的前端在请求后端接口时提示 403 Invalid CORS request.

## 解决方法

修改 Nginx 反向代理 Header 的 Host 设置:

```nginx
proxy_set_header Host $http_host
```

## 问题分析

```nginx
server {
  listen 8080;
  server_name _;
  location / {
      proxy_pass http://192.168.1.100:5000;
  }
}
```

1. 不设置 `proxy_set_header Host` 时，浏览器直接访问 nginx，获取到的 Host 是 `proxy_pass` 后面的值，即 `$proxy_host` 的值。
```none
http://192.168.1.100:5000
```
2. 设置 `proxy_set_header Host $host` 时，浏览器直接访问 nginx，获取到的 Host 是 `$host` 的值，没有端口信息。
```none
http://192.168.1.100
```
3. 设置 `proxy_set_header Host $host:$proxy_port` 时，浏览器直接访问 nginx，获取到的 Host 是 `$host:$proxy_port` 的值。
```none
http://192.168.1.100:5000
```
4. 设置 `proxy_set_header Host $http_host` 时，浏览器直接访问 nginx，获取到的 Host 包含浏览器请求的 IP 和端口。
```none
http://192.168.1.100:8080
```

设置 `proxy_set_header Host $host` 时，浏览器直接访问 nginx，获取到的 Host 是 `$host` 的值，
无端口信息。此时代码中若有重定向路由，则重定向时就会丢失端口信息，导致 404。
