# WSL

## WSL 磁盘镜像迁移

1. 关闭 WSL
```
wsl --shutdown
```
2. 查看已安装的 WSL
```
wsl -l -v
```
3. 导出 tar 包
```
wsl --export Ubuntu D:\Ubuntu.tar
```
4. 导入 tar 包
```
wsl --import Ubuntu-22.04 D:\wsl\ubuntu-22.04 D:\Ubuntu.tar --version 2
```
5. 删除原来的系统
```
wsl --unregister Ubuntu
```

## 更改登录的默认用户

```
vim  /etc/wsl.conf
#[user]
#default = your-user-name

exit

wsl --shutdown

wsl -d Ubuntu
```

## WSL 磁盘镜像压缩

1. 关闭 WSL
```
wsl --shutdown
```
2. 进入 `diskpart`
```
diskpart
```
3. 找到对应的 vhdx 文件的路径
```
select vdisk file="C:\Users\......\ext4.vhdx"
attach vdisk readonly
compact vdisk
detach vdisk
exit
```

`compact vdisk` 会扫描虚拟磁盘，仅保留实际存储数据的区块，但前提是
未使用的空间必须被显式填充为零 (e.g. `dd if=/dev/zero`)。若删除文件后数据块
没有置零，则可能被视为已使用空间。

## 更新 WSL 的版本

从 GitHub 下载:

```
wsl --update --web-download
```

## 关闭 WSL

```
wsl --shutdown
```

## 设置默认版本

```
wsl --set-default-version 2
```

## hyper-v

```
# enable hyper-v
# This ensures the Hyper-V hypervisor starts automatically during system boot,
# allowing Windows features like Windows Subsystem for Linux (WSL2) and
# virtualization-based security (VBS) to function.
bcdedit /set hypervisorlaunchtype auto

# disable hyper-v
# This prevents Hyper-V from starting, freeing CPU virtualization extensions
# (Intel VT-x or AMD-V) for other virtualization software such as VMware or
# VirtualBox, and can improve performance in certain games or applications that
# conflict with Hyper-V.
bcdedit /set hypervisorlaunchtype off
```

## 安装 wsl 错误代码 0xc03a0014

错误信息: WslRegisterDistribution failed with error: **0xc03a0014**

解决: 设备管理器 => 打开 Microsoft 虚拟驱动器枚举器.

## 安装 wsl 错误代码 0x80071772

错误信息: WslRegisterDistribution failed with error: **0x80071772**

解决:
1. Open `Settings` (设置)
2. Go to `System > Storage` (系统、存储、高级存储设置)
3. Click `Change where new content is saved` (保存新内容的地方)
4. Set `New apps will save to` C: drive (设置为 C 盘)

## Windows 11 家庭版开启 hyper-v

安装WSL2首先要保证操作系统可开启hyper-v功能，
默认支持开启hyper-v的版本为：Windows11企业版、专业版或教育版，
而家庭版是不支持开启的，需自行安装相关组件来开启hyper-v功能。

**开启步骤**:
1. 任意目录创建文本文件，将以下代码复制并保存在文件内。
```
pushd "%\~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V-All /LimitAccess /ALL
```
2. 文件重命名为 `hyper-v.bat`
3. 右击 `hyper-v.bat` 选择以管理员身份运行
4. 等待指令执行完毕后，会提示输入y以重启计算机。如已经准备好重启，此时输入y即可。
5. 电脑重启后，再 windows 功能列表中找到 hyper-v 勾选即可

## 启用 wsl 和虚拟化

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

## 下载发行版

```
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
# or
curl.exe -L -o ubuntu-2004.appx https://aka.ms/wslubuntu2004
```

## 安装到 C 盘

双击安装或者输入命令。


```
Add-AppxPackage .\Ubuntu.appx
```

## WSL 发行版下载加速

1. 进入微软官方应用商店 Web 版本，搜索对应的发行版并进入，复制对应的发行版页面的链接。
2. 使用解析站点解析上一步得到链接。
3. 使用解析得到的链接下载发行版。

- 微软官方应用商店: [https://apps.microsoft.com/home?hl=en-us&gl=CN](https://apps.microsoft.com/home?hl=en-us&gl=CN)
- 解析站点(online link generator for microsoft sotre: [https://store.rg-adguard.net/](https://store.rg-adguard.net/)
