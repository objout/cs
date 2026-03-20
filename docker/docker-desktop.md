# Docker Desktop

## Windows 自定义 Docker Desktop 安装位置

```
set INSTALLER="Docker Desktop Installer.exe"
set INSTALL_DIR="D:\programs\docker\docker-desktop"
set WSL_DIR="D:\programs\docker\wsl"
md %INSTALL_DIR%
md %WSL_DIR%
start/w "" %INSTALLER% install -accept -license --installation-dir=%INSTALL_DIR% --wsl-default-data-root=%WSL_DIR%
```
