@ECHO OFF

:: 设置服务端占用最大内存，单位是M或者G，1G=1024M
set Xmax=30G
:: 设置服务端占用最小内存，单位是M或者G
set Xmin=1G
:: 设置服务端核心名称，不需要jar后缀
set Core=leaves-1.21.1

:: 以下内容不会修改轻不要修改
:MAIN
cls
title 生存服
@echo. ---------------------------------------------------------------------
@echo.                    MineCraft优化型服务端
@echo.   服务器加载中，请勿随便关闭本窗口，若出现 /help 字样则开服成功
@echo.
@echo.   注意:关闭服务器前请在后台输入stop保存玩家数据，且出现重启标识再关
@echo.        本窗口
@echo.
@echo.   崩溃报告: crash-report/时间最新.txt
@echo.   服务器日志: Logs/latest.txt
@echo. ---------------------------------------------------------------------

ping -n 1 127.1>nul
echo -  服务端最小内存/最大内存：%Xmin%/%Xmax%
@echo.
ping -n 1 127.1>nul
echo -  服务端核心：%Core%
@echo.


"D:\Compiler\Java\zulu21.34.19-ca-jdk21.0.3-win_x64\bin\java.exe" -Xmx%Xmax% -Xms%Xmin% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %Core%.jar nogui


@echo.. ---------------------------------------------------------------------
@echo.                    MineCraft服务端已经成功关闭
@echo.
echo  (%time%) 服务器准备重启
@echo.
@echo.   注意:等待时间过后会准备重启，直接关掉窗口则为关服
@echo.
@echo.   崩溃报告: crash-report/时间最新.txt
@echo.   服务器日志: Logs/latest.txt
@echo. ---------------------------------------------------------------------
@echo.
timeout 10
goto MAIN

:END