@echo off
set x=100
cd/d "%userprofile%\Downloads"
set tmp_fold=tempdw-%random%
md %tmp_fold%
cd %tmp_fold%
:dw
start/b curl -LkO cccaaron.github.io/files/SQL22/data/part%x:~1%
set/a x+=1
if %x% leq 146 goto dw
timeout 45 >nul
:wait
timeout 3 >nul
tasklist|find/i "curl" >nul&&goto wait
copy/b part* ..\SW_DVD9_NTRL_SQL_Svr_Standard_Edtn_2022_64Bit_English_OEM_VL_X23-28393.ISO
cd ..
rd/s /q %tmp_fold%
del/q "%~f0"&exit
