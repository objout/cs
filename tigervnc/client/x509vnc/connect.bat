@echo off

if "%1" == "h" goto begin
mshta Vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close) && exit

:begin
rem TODO
vncviewer.exe -PasswordFile .\passwd .\desktop.tigervnc
