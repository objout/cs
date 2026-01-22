# Network

## WIFI 相关

```
# 打开网络连接的面板
ncpa.cpl

# 连接到 WIFI
netsh wlan connect profilename [ssid=ssid-name] [interface=interface-name]
netsh wlan connect name=PROFILE
netsh wlan connect ssid=SSID name=PROFILE

# 查看 profile
netsh wlan show profiles

# 查看已连接的 WIFI 密码
netsh wlan show profiles name="profile name" interface="interface name" key=clear

# 断开连接
netsh wlan disconnect

# 显示无线网络接口
netsh wlan show interfaces
```
