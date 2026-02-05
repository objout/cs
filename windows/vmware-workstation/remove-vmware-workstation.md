# Windows 彻底清理 VMware Workstation

## 停止和 VMware 有关的服务

```
services.msc
```

## 卸载程序

打开程序和功能，找到 VMware 卸载。

```
appwiz.cpl
```

## 清理残留目录

以管理员身份运行 `cmd` (以下皆是如此)

```
rmdir /s /q "C:\Program Files\VMware"
rmdir /s /q "C:\Program Files (x86)\VMware"
rmdir /s /q "%PROGRAMDATA%\VMware"
rmdir /s /q "%APPDATA%\VMware"
rmdir /s /q "%LOCALAPPDATA%\VMware"
```

## 清理注册表

先备份注册表:

```
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\VMware, Inc." vmware_backup.reg
```

powershell 中执行命令:

```
$keys = @(
    "HKLM:\SOFTWARE\VMware, Inc.",
    "HKLM:\SOFTWARE\WOW6432Node\VMware, Inc.",
    "HKCU:\SOFTWARE\VMware, Inc.",
    "HKLM:\SYSTEM\CurrentControlSet\Services\VMAuthdService",
    "HKLM:\SYSTEM\CurrentControlSet\Services\VMnetDHCP",
    "HKLM:\SYSTEM\CurrentControlSet\Services\VMware NAT Service"
)


foreach ($key in $keys) {
    if (Test-Path $key) {
        Remove-Item -Path $key -Recurse -Force
        Write-Host "Deleted: $key"
    }
}
```

## 停止并删除服务

查看所有 VMware 服务

```
sc query | findstr /i vmware
sc query | findstr /i vm
```

逐个停止并删除

```
$services = @(
    "VMAuthdService",
    "VMnetDHCP",
    "VMUSBArbService",
    "VMware NAT Service",
    "VMwareHostd"
)

foreach ($service in $services) {
    Stop-Service -Name $service -Force -ErrorAction SilentlyContinue

    & sc.exe delete $service 2>$null

    Write-Host "Service: $service"
}
```

## 删除驱动文件

删除 `.sys` 驱动文件

```
del /f /q "C:\Windows\System32\drivers\vmx86.sys"
del /f /q "C:\Windows\System32\drivers\vmci.sys"
del /f /q "C:\Windows\System32\drivers\vmnet.sys"
del /f /q "C:\Windows\System32\drivers\vmnetadapter.sys"
del /f /q "C:\Windows\System32\drivers\vmnetbridge.sys"
del /f /q "C:\Windows\System32\drivers\vmnetuserif.sys"
del /f /q "C:\Windows\System32\drivers\hcmon.sys"
del /f /q "C:\Windows\System32\drivers\vstor2-mntapi20-shared.sys"
```

删除 `.inf` 文件

```
rem del /f /q "C:\Windows\inf\vm*.inf"
rem del /f /q "C:\Windows\inf\oem*.inf"
```

## 清理网络适配器

打开网络连接

```
ncpa.cpl
```

删除所有 "VMware Virtual Ethernet Adapter"

或者 powershell 命令

```
Get-NetAdapter | Where-Object {$_.Name -like "*VMware*"}

Get-NetAdapter | Where-Object {$_.Name -like "*VMware*"} | Remove-NetAdapter -Confirm:$false
```

## 使用清理工具

使用 `CCleaner` 清理无用注册表。

## 检查

```
# 检查服务
Get-Service | Where-Object {$_.DisplayName -like "*VMware*" -or $_.Name -like "vm*"}

# 检查进程
Get-Process | Where-Object {$_.ProcessName -like "*vmware*"}

# 检查文件
dir "C:\" /s /b | findstr /i vmware 2>$null
dir "%PROGRAMFILES%" /s /b | findstr /i vmware 2>$null

# 检查注册表
reg query "HKLM\SOFTWARE" /f "vmware" /s
reg query "HKLM\SYSTEM\CurrentControlSet\Services" /f "vm" /s
```

## 重启

```
shutdown /r /t 5
```
