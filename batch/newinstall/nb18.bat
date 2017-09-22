@echo off

REM =================================
if [%1]==[] %~dp0\..\utility\getadmin.bat "%~dp0\%~nx0"

REM =================================
set path=%path%;C:\Program Files (x86)\Git\cmd
set DOC=d:\Users\%USERNAME%\Documents
set TASKS=%DOC%\tasks
set SCHEDULE=19:30-20:00-20:30
set DAILY=%SCHEDULE:~0,5%
set WEEKLY=%SCHEDULE:~6,5%
set MONTHLY=%SCHEDULE:~12,5%
set PASS=1

REM =================================

powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

REM =================================

choco feature enable -nautoUninstaller

cinst -y 7zip everything git google-chrome-x64 python2 microsoftsecurityessentials teamviewer classic-shell cmder f.lux paint.net kodi potplayer foxitreader filebot notepadplusplus putty

REM =================================

mkdir %DOC%
cd/d %DOC%
git clone https://github.com/chsliu/batch.git tasks

SchTasks /Create /F /RL HIGHEST /RU %USERNAME% /RP %PASS% /SC ONSTART /TN "%USERNAME%-startup" /TR "%TASKS%\startup.bat"
SchTasks /Create /F /RL HIGHEST /RU %USERNAME% /RP %PASS% /SC DAILY /TN "%USERNAME%-daily" /TR "%TASKS%\daily.bat" /ST %DAILY%
SchTasks /Create /F /RL HIGHEST /RU %USERNAME% /RP %PASS% /SC WEEKLY /D FRI /TN "%USERNAME%-weekly" /TR "%TASKS%\weekly.bat" /ST %WEEKLY%
SchTasks /Create /F /RL HIGHEST /RU %USERNAME% /RP %PASS% /SC MONTHLY /MO LAST /D FRI /TN "%USERNAME%-monthly" /TR "%TASKS%\monthly.bat" /ST %MONTHLY%

REM =================================

call %~dp0\newinstall.kodi.bat

REM =================================

rem pause

C:\Windows\System32\timeout.exe 10
