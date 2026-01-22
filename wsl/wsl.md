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
