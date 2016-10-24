;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat %CMDER_ROOT%\config\.history
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars --color $*
pwd=cd
clear=cls
bat=pushd d:\Users\sita\Documents\tasks\batch\ssh  
kodi=pushd C:\Users\sita\AppData\Roaming\Kodi  
va=pushd D:\Users\sita\vagrant 
u=pushd D:\Users\sita\Documents\tasks\utility
csave=robocopy C:\tools\cmder D:\Users\sita\Documents\tasks\cmder *.bat *.cmd *.sh *.xml /S /R:0 /NDL /NJH /NJS /MT & d:\Users\sita\Documents\tasks\utility\gitsync.bat
cload=d:\Users\sita\Documents\tasks\utility\gitsync.bat & robocopy D:\Users\sita\Documents\tasks\cmder C:\tools\cmder *.bat *.cmd *.sh *.xml /S /R:0 /NDL /NJH /NJS /MT
cfg="C:\Program Files (x86)\Notepad++\notepad++.exe" C:\tools\cmder\config\user-aliases.cmd
re=alias /reload
al=alias
gs=git status
gp=d:\Users\sita\Documents\tasks\utility\gitsync.bat
pd=popd
