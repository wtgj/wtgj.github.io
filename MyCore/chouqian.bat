@echo off&color 3e&mode con cols=55
set nab=1-47
title 不重复随机抽取 %nab%
echo/
echo ==========================
echo/
echo 背书抽签开始啦!
echo/
echo ^( %nab% ^)
echo ==========================
echo/
echo 请输入一名字后回车或直接回车进行抽签,
echo/&echo 中止抽签请按 q 回车:&echo/
setlocal enabledelayedexpansion
set nbn=%nab:*-=%
call set nb0=%%nab:-!nbn!=%%
(for /L %%s in (%nb0%,1,%nbn%)do (
call :geths
set !hs!=%%s&echo.!hs!
))>tem.yky
for /f %%r in ('type tem.yky^|sort')do (
set w=&set/p w=
if /i "!w!"=="q" goto :end
set/a n+=1
echo 第 !n! 个抽的是: !%%r!)
:end
del tem.yky
echo/&echo 抽签完毕! 按任意键退出...
pause>nul&exit
:geths
set hs=%random%
if defined %hs% goto geths