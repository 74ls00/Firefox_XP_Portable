@echo off
rem � http://xbit.me
rem http://forum.script-coding.com/viewtopic.php?id=4106 - ��������� ��� ����
set now=%DATE: =0% %TIME: =0%
for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do (
rem    %%a - ��� %%b - ����� %%c - ���� %%d - ���� %%e - ������ %%f - ������� %%g - �����
rem	set now=%%a%%b%%c%%d%%e
rem ��� %%c - ��� %%b - ����� %%a - ���� %%d - ���� %%e - ������ %%f - ������� %%g - �����
rem set now=%%c%%b%%a_%%d%%e
set now=%%a%%b%%c_%%d%%e

)

rem ������ �����
cls
set ffpath=%~d0%~p0
rem ��� �����
set bpfile=Data\Firefox\sessionstore.js
rem ��������� ������
set bfname=Backup-
rem ���b �������
set drvbak=%ffpath%Backup\session
rem set drvbak2p=G:\home\Documents\Projects\0-MyFirefox\FirefoxPortable\Backup\session
echo %ffpath%
cd %ffpath%
%ffpath%App\7za.exe a "%drvbak%\%bfname%%now%.7z" %ffpath%\%bpfile% -m0=BCJ2 -m1=LZMA:d25:fb255 -m2=LZMA:d19 -m3=LZMA:d19 -mb0:1 -mb0s1:2 -mb0s2:3 -mx

copy %ffpath%Backup\%bfname%%now%.7z %drvbak2p%\%bfname%%now%.7z 

echo %drvbak%\%bfname%%now%.7z
echo %drvbak2p%\%bfname%%now%.7z 
start /d %ffpath% FirefoxPortable.exe





