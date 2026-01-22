# Docker Desktop

## Windows 自定义 Docker Desktop 安装位置

```
set INSTALLER="Docker Desktop Installer.exe"
set INSTALL_DIR="D:\docker\docker-desktop"
set WSL_DIR="D:\docker\wsl"
start/w "" %INSTALLER% install -accept -license --installation-dir=%INSTALL_DIR% --wsl-default-data-root=%WSL_DIR%
```
