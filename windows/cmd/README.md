# Cmd

## 常用命令

```
# 控制面板
control

# 启用或关闭 Windows 功能
optionalfeatures

# 配置环境变量面板
# system data management control panel
sysdm.cpl

# 画板
mspaint

# 记事本
notepad

# 文件管理器
explorer

# 注册表编辑
regedit

# 服务
services.msc

# 驱动
drivers

# 进入用户主目录
%HomeDrive%
cd %HomePath%

# 文件管理器中打开用户主目录
explorer %HomePath%

# 文件管理器中打开用户应用数据目录
explorer %AppData%

# 任务管理器
taskmgr

# 任务计划程序
taskschd.msc
```

## 常用环境变量

| 变量                       | 说明                                |
|----------------------------|-------------------------------------|
| `%AppData%`                | 当前用户应用数据目录                |
| `%UserName%`               | 当前用户名                          |
| `%Time%`                   | 当前时间                            |
| `%Date%`                   | 当前日期                            |
| `%Random%`                 | 0-32767的随机数                     |
| `%AllUsersProfile%`        | 所有用户配置文件的位置              |
| `%Cd%`                     | 当前目录                            |
| `%CmdCmdLine%`             | 用于启动当前的 cmd.exe 的准确命令行 |
| `%CommonProgramFiles%`     | 程序文件通用目录                    |
| `%ComputerName%`           | 计算机名称                          |
| `%ComSpec%`                | 命令解释器可执行程序的完整路径      |
| `%ErrorLevel%`             | 上一个命令的错误码                  |
| `%HomeDrive%`              | 用户家目录所在的盘                  |
| `%HomePath%`               | 用户家目录的路径                    |
| `%Number_Of_Processors%`   | 计算机逻辑处理器的个数              |
| `%Processor_Architecture%` | 处理器架构                          |
| `%Processor_Identifier%`   | 处理器标识符                        |
| `%Processor_Level%`        | 处理器等级                          |
| `%Processor_Revision%`     | 处理器修订号                        |
| `%Os%`                     | 操作系统名称                        |
| `%Path%`                   | 可执行文件的搜索路径                |
| `%PathExt%`                | 可执行文件扩展名的列表              |
| `%ProgramFiles%`           | 程序默认安装目录                    |
| `%Prompt%`                 | 命令提示符                          |
| `%SystemDrive%`            | 系统所在的盘                        |
| `%SystemRoot%`             | 系统根目录                          |
| `%Temp%`                   | 默认临时目录                        |
| `%WinDir%`                 | Windows 目录的位置                  |
