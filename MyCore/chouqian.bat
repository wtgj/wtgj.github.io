@echo off&color 3e&mode con cols=55
set nab=1-47
title ���ظ������ȡ %nab%
echo/
echo ==========================
echo/
echo �����ǩ��ʼ��!
echo/
echo ^( %nab% ^)
echo ==========================
echo/
echo ������һ���ֺ�س���ֱ�ӻس����г�ǩ,
echo/&echo ��ֹ��ǩ�밴 q �س�:&echo/
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
echo �� !n! �������: !%%r!)
:end
del tem.yky
echo/&echo ��ǩ���! ��������˳�...
pause>nul&exit
:geths
set hs=%random%
if defined %hs% goto geths