@echo off
rem © http://xbit.me
rem http://forum.script-coding.com/viewtopic.php?id=4106 - подробнее про дату
set now=%DATE: =0% %TIME: =0%
for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do (
rem    %%a - год %%b - месяц %%c - день %%d - часы %%e - минуты %%f - секунды %%g - сотые
rem	set now=%%a%%b%%c%%d%%e
rem ИЛИ %%c - год %%b - месяц %%a - день %%d - часы %%e - минуты %%f - секунды %%g - сотые
rem set now=%%c%%b%%a_%%d%%e
set now=%%a%%b%%c_%%d%%e

)

rem Делаем Бэкап
cls
set ffpath=%~d0%~p0
rem Имя файла
set bpfile=Data\Firefox\sessionstore.js
rem Заголовок бэкапа
set bfname=Backup-
rem Путb бэкапов
set drvbak=%ffpath%Backup\session
rem set drvbak2p=G:\home\Documents\Projects\0-MyFirefox\FirefoxPortable\Backup\session
echo %ffpath%
cd %ffpath%
%ffpath%App\7za.exe a "%drvbak%\%bfname%%now%.7z" %ffpath%\%bpfile% -m0=BCJ2 -m1=LZMA:d25:fb255 -m2=LZMA:d19 -m3=LZMA:d19 -mb0:1 -mb0s1:2 -mb0s2:3 -mx

copy %ffpath%Backup\%bfname%%now%.7z %drvbak2p%\%bfname%%now%.7z 

echo %drvbak%\%bfname%%now%.7z
echo %drvbak2p%\%bfname%%now%.7z 
start /d %ffpath% FirefoxPortable.exe





